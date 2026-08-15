# completions.nu: custom completions

def "nu-complete vp" [context: string] {
  let tokens = ($context | split row " ")
  let result = (VP_COMPLETE=fish ^vp -- ...$tokens | complete)
  if $result.exit_code != 0 {
    return null
  }

  {
    options: { sort: false }
    completions: (
      $result.stdout
      | from tsv --flexible --noheaders --no-infer
      | rename value description
    )
  }
}

def "nu-complete vpr" [context: string] {
  let rest = ($context | split row " " | skip 1)

  nu-complete vp (["vp" "run"] | append $rest | str join " ")
}

extern "vp" [...args: string@"nu-complete vp"]
extern "vpr" [...args: string@"nu-complete vpr"]
