# Disconnect

Remove a callback from a message. [`#!luau light.disconnect()`](./disconnect.md) returns the old callback if there was
one.

## `#!luau function light.disconnect`

```luau title='<!-- client --> <!-- sync -->'
function disconnect<Data>(
   message: Message<Data>
) -> (
   ((Data) -> ())?
)
```

## `#!luau function light.disconnect`

```luau title='<!-- server --> <!-- sync -->'
function disconnect<Data>(
   message: Message<Data>
) -> (
   ((Player, Data) -> ())?
)
```

An example message-call profiler using
[`#!luau light.disconnect()`](./disconnect.md) and
[`#!luau light.connect_sync()`](./connect_sync.md):

```luau title="profiler.luau"
local profile_message
do
    local sessions = {}
    function profile_message(message: Message)
        if sessions[message] then
            return nil
        end

        local old_callback = light.disconnect(message)

        if not old_callback then
            return nil
        end

        local calls = 0

        light.connect_sync(message, function(...)
            calls += 1

            old_callback(...)
        end)

        -- wrapping in a coroutine since session shouldn't be ended twice
        sessions[message] = coroutine.wrap(function()
            sessions[message] = nil

            light.disconnect(message)

            light.connect(message, old_callback)

            return table.freeze({
                calls = calls
            })
        end)

        return sessions[message]
    end
end
```
