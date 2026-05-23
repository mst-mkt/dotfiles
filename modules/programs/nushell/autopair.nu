# autopair.nu: 括弧や引用符の入力や削除に応じてペアの挿入や削除、カーソル位置の調整を行う

const autopair_pairs = {
  "(": ")"
  "[": "]"
  "{": "}"
  '"': '"'
  "'": "'"
  "`": "`"
}

def autopair-backspace [] {
  let pos = (commandline get-cursor)
  if $pos <= 0 { return }

  let chars = (commandline | split chars)
  let before = ($chars | get ($pos - 1))
  let expected_close = ($autopair_pairs | get --optional $before)
  let in_empty_pair = (
    $pos < ($chars | length)
    and ($expected_close != null)
    and ($expected_close == ($chars | get $pos))
  )

  let dropped = if $in_empty_pair {
    $chars | drop nth ($pos - 1) $pos
  } else {
    $chars | drop nth ($pos - 1)
  }

  commandline edit --replace ($dropped | str join)
  commandline set-cursor ($pos - 1)
}

let autopair_insert_keybindings = ($autopair_pairs | columns | each {|open|
  let close = ($autopair_pairs | get $open)
  {
    name: $"autopair_insert_($open)"
    modifier: none
    keycode: $"char_($open)"
    mode: [emacs vi_insert]
    event: [
      { edit: insertstring, value: $"($open)($close)" }
      { edit: moveleft }
    ]
  }
})

let autopair_keybindings = ($autopair_insert_keybindings | append {
  name: autopair_backspace
  modifier: none
  keycode: backspace
  mode: [emacs vi_insert]
  event: { send: executehostcommand, cmd: "autopair-backspace" }
})

$env.config.keybindings = ($env.config.keybindings | append $autopair_keybindings)
