# functions.nu: custom functions

# ghcd: ghq 管理下のリポジトリを sk で選択して cd
# deps: ghq, nu_plugin_skim
def --env ghcd [] {
  let result = (^ghq list | lines | sk)
  if ($result | is-not-empty) {
    cd ((^ghq root | str trim) | path join ($result | to text | str trim))
  }
}
