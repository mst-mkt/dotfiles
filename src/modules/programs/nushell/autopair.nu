# autopair.nu: 括弧や引用符を入力に応じてペアの挿入やカーソル位置の調整を行う

let autopair_keybindings = [
  {
    name: autopair_lparen
    modifier: none
    keycode: "char_("
    mode: [emacs vi_insert]
    event: [
      { edit: insertstring, value: "()" }
      { edit: moveleft }
    ]
  }
  {
    name: autopair_lbracket
    modifier: none
    keycode: "char_["
    mode: [emacs vi_insert]
    event: [
      { edit: insertstring, value: "[]" }
      { edit: moveleft }
    ]
  }
  {
    name: autopair_lbrace
    modifier: none
    keycode: "char_{"
    mode: [emacs vi_insert]
    event: [
      { edit: insertstring, value: "{}" }
      { edit: moveleft }
    ]
  }
  {
    name: autopair_dquote
    modifier: none
    keycode: "char_\""
    mode: [emacs vi_insert]
    event: [
      { edit: insertstring, value: '""' }
      { edit: moveleft }
    ]
  }
  {
    name: autopair_squote
    modifier: none
    keycode: "char_'"
    mode: [emacs vi_insert]
    event: [
      { edit: insertstring, value: "''" }
      { edit: moveleft }
    ]
  }
  {
    name: autopair_backtick
    modifier: none
    keycode: "char_`"
    mode: [emacs vi_insert]
    event: [
      { edit: insertstring, value: "``" }
      { edit: moveleft }
    ]
  }
]

$env.config.keybindings = ($env.config.keybindings | append $autopair_keybindings)
