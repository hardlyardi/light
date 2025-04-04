# Send To All

Send To All function similarly to calling [`#!luau light.send()`](./send.md) on each player in the server, but will only
need to serialize once.

!!! tip "You should usually prefer [`#!luau light.broadcast_to_all()`](./broadcast_to_all.md) over [`#!luau light.send_to_all()`](./send_to_all.md)"

    This is because the latter can take up more memory. Light "broadcasts" can save memory by writing data to a single
    stream and batching it to relevant players instead of writing to a single stream and copying it for each player. To
    learn more, check out [The Internals Blog](../../../../blog/internals/dynamic_streams.md) on the topic.

## `#!luau function light.send_to_all`

```luau title='<!-- server --> <!-- sync -->'
function send_to_all<T>(
   message: Message<T>,
   data: T
): ()
```

Send a message with given data to all players, for example:

```luau
Players.PlayerAdded:Connect(function()
   light.send_to_all(messages.join_sound)
end)
```
