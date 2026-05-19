# functions.nu: custom functions

# ghcd: ghq 管理下のリポジトリを sk で選択して cd
# deps: ghq, nu_plugin_skim
def --env ghcd [] {
  let result = (^ghq list | lines | sk)
  if ($result | is-not-empty) {
    cd ((^ghq root | str trim) | path join ($result | to text | str trim))
  }
}

# ghget: GitHub 上のリポジトリを sk で選択して ghq get -p
# deps: ghq, gh cli, nu_plugin_skim
def --env ghget [] {
  let existing = ghq list
    | lines
    | where { |it| $it | str starts-with "github.com/" }
    | each { |it| $it | str replace "github.com/" "" }

  let all_repos = gh api graphql --paginate -f query='
    query($endCursor: String) {
      viewer {
        repositories(
          first: 100
          after: $endCursor
          affiliations: [OWNER, COLLABORATOR, ORGANIZATION_MEMBER]
        ) {
          nodes { nameWithOwner }
          pageInfo { hasNextPage endCursor }
        }
      }
    }' --jq '.data.viewer.repositories.nodes[].nameWithOwner'
    | lines

  let selected = $all_repos
    | where { |it| $it not-in $existing }
    | sk

  if ($selected | is-not-empty) {
    let repo = ($selected | to text | str trim)
    ghq get -p $repo
    let dest = (^ghq root | str trim | path join "github.com" $repo)
    cd $dest
  }
}
