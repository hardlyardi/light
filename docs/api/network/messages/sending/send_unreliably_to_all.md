# Send Unreliably To All

Send Unreliably To All is identical to [`#!luau light.send_to_all()`](./send_to_all.md), except it sends the message
<a href="https://create.roblox.com/docs/reference/engine/classes/UnreliableRemoteEvent" target="_blank">unreliably</a>.

## `#!luau function light.send_unreliably_to_all`

```luau title='<!-- server --> <!-- sync -->'
function send_unreliably_to_all<T>(
    message: Message<T>,
    data: T
): ()
```

Send a message with given data to all players
<a href="https://create.roblox.com/docs/reference/engine/classes/UnreliableRemoteEvent" target="_blank">unreliably</a>.
