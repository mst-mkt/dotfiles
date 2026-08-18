def send-action [action: record] {
  let response = (
    { Action: $action }
    | to json --raw
    | socat - $"UNIX-CONNECT:($env.NIRI_SOCKET)"
    | from json
  )

  if ($response | get -o Err) != null { print -e $response.Err }
}

def main [pip_title: string] {
  for $event in (niri msg --json event-stream | lines) {
    let workspace = ($event | from json | get -o WorkspaceActivated)
    if $workspace == null or not $workspace.focused { continue }

    try {
      niri msg --json windows
      | from json
      | where is_floating
      | where workspace_id != $workspace.id
      | where ($it.title | default "") =~ $pip_title
      | each {|window|
          send-action {
            MoveWindowToWorkspace: {
              window_id: $window.id
              reference: { Id: $workspace.id }
              focus: false
            }
          }
        }
      | ignore
    } catch {|e| print -e $e.rendered }
  }
}
