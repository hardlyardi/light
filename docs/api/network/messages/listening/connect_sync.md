# Connect Sync

There is little to no downside of using
[`#!luau light.connect()`](./connect.md), this function exists for optimizing frequently sent messages in potentially
large servers (or for optimizing memory usage.) If that's not you, you should skip this page.

[`#!luau light.connect_sync()`](./connect_sync.md) does the same thing as [`#!luau light.connect()`](./connect.md)
with one major difference. Thread reuse will not be used with [`#!luau light.connect_sync()`](./connect_sync.md), and
the function will be called directly. This means if you yield in your callback, you could get a buffer access out of
bounds or cause other unexpected internal issues. If you don't know what that implies, use
[`#!luau light.connect()`](./connect.md).

!!! tip "This function can error if there is already a callback connected."

    Consider calling [`#!luau light.disconnect()`](./disconnect.md) first if this is an issue.

## `#!luau function light.connect_sync`

```luau title='<!-- client --> <!-- sync --> <!-- errors -->'
function connect_sync<Data>(
   message: Message<Data>,
   callback: (Data) -> ()
): ()
```

## `#!luau function light.connect_sync`

```luau title='<!-- server --> <!-- sync --> <!-- errors -->'
function connect_sync<Data>(
   message: Message<Data>,
   callback: (Player, Data) -> ()
): ()
```

An example client-side event polling utility using [`#!luau light.connect_sync()`](./connect_sync.md):

```luau title="polling.luau"
local function poll<Data>(message: Data)
    local data_table = {}
    local next_insert = 1

    light.connect_sync(message, function(data)
        data_table[next_insert] = data
        next_insert += 1
    end)

    local next_index = 1
    local function iter_next(): Data?
        if next_index < next_insert then
            local data = data_table[next_index]
            next_index += 1

            return data
        end

        -- end iterator / reset
        next_index = 1
        next_insert = 1
        data_table = {}

        return nil
    end

    return iter_next
end
```

And an example on how to use the above poll util:

```luau title="attack_handler.client.luau"
local attacks = poll(messages.attack)

RunService.PreRender:Connect(function()
   for attack_data in attacks do
      print(`{attack_data.plr} attacked at {attack_data.pos}!`)
   end
end)
```
