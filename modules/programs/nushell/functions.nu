# functions.nu: custom functions

# ghcd: ghq 管理下のリポジトリを fuzzy find して cd
# deps: ghq
def --env ghcd [] {
  let result = (^ghq list | lines | input list --fuzzy)
  if ($result | is-not-empty) {
    cd ((^ghq root | str trim) | path join ($result | to text | str trim))
  }
}

# ghget: GitHub 上のリポジトリを fuzzy find して ghq get -p
# deps: ghq, gh cli
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
    | input list --fuzzy

  if ($selected | is-not-empty) {
    let repo = ($selected | to text | str trim)
    ghq get -p $repo
    let dest = (^ghq root | str trim | path join "github.com" $repo)
    cd $dest
  }
}

# gfom: origin のデフォルトブランチを fetch
# deps: git
def gfom [] {
  let branch = (git symbolic-ref refs/remotes/origin/HEAD | str replace "refs/remotes/origin/" "")
  git fetch origin $branch
}

# gplom: origin のデフォルトブランチを pull
# deps: git
def gplom [] {
  let branch = (git symbolic-ref refs/remotes/origin/HEAD | str replace "refs/remotes/origin/" "")
  git pull origin $branch
}

# gpsom: origin のデフォルトブランチに push
# deps: git
def gpsom [] {
  let branch = (git symbolic-ref refs/remotes/origin/HEAD | str replace "refs/remotes/origin/" "")
  git push origin $branch
}

# ghsw: ローカルブランチを fuzzy find して switch
# deps: git
def ghsw [] {
  let selected = (^git branch --format='%(refname:short)' | lines | input list --fuzzy)
  if ($selected | is-not-empty) {
    let branch = ($selected | to text | str trim)
    ^git switch $branch
  }
}
