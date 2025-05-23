# Send Unreliably

Identical behavior to [`#!luau light.send()`](./send.md), except the message is
<a href="https://create.roblox.com/docs/reference/engine/classes/UnreliableRemoteEvent" target="_blank">unreliable</a>.
There is no size limit on light unreliable sending&mdash;however, sending
[instances](../../../datatypes/instances.md) /
[any](../../../datatypes/any.md) /
[checked](../../../datatypes/generics/checked.md)
can cause it to exceed size thresholds and fail to send.

## `#!luau function light.send_unreliably`

```luau title='<!-- client --> <!-- sync -->'
function send_unreliably<T>(
    message: Message<T>,
    data: T
): ()
```

!!! tip "Sending messages to multiple people"

    To send unreliable messages to multiple people on the server, check out
    [`#!luau light.broadcast_unreliably()`](./broadcast_unreliably.md).

## `#!luau function light.send_unreliably`

```luau title='<!-- server --> <!-- sync -->'
function send_unreliably<T>(
    message: Message<T>,
    to: Player,
    data: T
): ()
```
