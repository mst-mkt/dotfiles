# prompt.nu: display git branch and git status
# deps: gstat (https://www.nushell.sh/commands/docs/gstat.html)
# symbols:
# - `=`: conflicts
# - `+`: staged changes
# - `!`: unstaged changes
# - `?`: untracked files
# - `×`: deleted files
# - `»`: renamed files
# - `$`: stashes
# - `↑`: ahead of remote
# - `↓`: behind remote

$env.PROMPT_COMMAND = {||
  let cwd = (pwd | str replace $env.HOME "~")

  let stat = try { gstat } catch { null }
  let git_str = if $stat == null or $stat.repo_name == "no_repository" {
    ""
  } else {
    let staged = (
      ($stat.idx_added_staged? | default 0) +
      ($stat.idx_modified_staged? | default 0) +
      ($stat.idx_deleted_staged? | default 0) +
      ($stat.idx_renamed? | default 0) +
      ($stat.idx_type_changed? | default 0)
    )
    let modified = ($stat.wt_modified? | default 0)
    let deleted = ($stat.wt_deleted? | default 0)
    let renamed = ($stat.wt_renamed? | default 0)
    let untracked = ($stat.wt_untracked? | default 0)
    let conflicts = ($stat.conflicts? | default 0)
    let stashes = ($stat.stashes? | default 0)
    let ahead = ($stat.ahead? | default 0)
    let behind = ($stat.behind? | default 0)

    let parts = (
      [
        (if $conflicts > 0 { "=" } else { null })
        (if $staged > 0 { "+" } else { null })
        (if $modified > 0 { "!" } else { null })
        (if $deleted > 0 { "×" } else { null })
        (if $renamed > 0 { "»" } else { null })
        (if $untracked > 0 { "?" } else { null })
        (if $stashes > 0 { "$" } else { null })
        (if $ahead > 0 { "↑" } else { null })
        (if $behind > 0 { "↓" } else { null })
      ] | compact
    )

    let status_str = if ($parts | is-empty) { "" } else { $" [($parts | str join '')]" }
    $" (ansi yellow_bold)($stat.branch)(ansi reset)($status_str)"
  }

  $"($cwd)($git_str)\n"
}

$env.PROMPT_COMMAND_RIGHT = {||
  let exit_code = $env.LAST_EXIT_CODE
  let is_error = $exit_code != 0
  let display_code = if $is_error { $"($exit_code) " } else { "" }

  let time = (date now | format date "%Y-%m-%d %H:%M:%S")

  $"($display_code)($time)"
}
