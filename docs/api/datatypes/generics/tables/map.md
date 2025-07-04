# Maps

Maps (a.k.a. Dictionaries) are quite simple.

A map represents a set of keys and values in a table.(1)
{.annotate}

1. E.g., This is something you might want to represent with a map:

    ```luau
    local abc = { [tostring(math.random())] = 255 }
    ```

You can define a valid map [Datatype](../../index.md#what-is-a-datatype) using a simple table, just like luau:

```luau
local ty = light.datatypes

local some_map = { [ty.str()] = ty.u8 }
```

Using the above table syntax will behave the same as passing the table into the API shown below.

## `#!luau function light.datatypes.map`

```luau title='<!-- shared --> <!-- sync -->'
function map<Key, Value>(
    key: Datatype<Key>,
    value: Datatype<Value>,
    length: Datatype<number>?
): (Datatype<{ [Key]: Value }>)
```

First two arguments should be any [Datatypes](../../index.md#what-is-a-datatype) which cannot represent `#!luau nil`.
The `length` parameter should represent the number of keys in the map, and will default to
[`#!luau datatypes.u16`](../../numbers/uints.md).

The length datatype should NOT be a regular number—instead: use a
datatype that represents a number, like a [`uint`](../../numbers/uints.md), or a
[`range`](../range.md#function-lightdatatypesrange).

A couple of ways you could use the optional `length` parameter:

```luau
local some_map = ty.map( ty.str(), ty.u8, ty.u8 ) -- between 0-255 keys.
```

```luau
local some_map = ty.map( ty.str(), ty.u8, ty.range(0, 50) ) -- Map should have between 0 and 50 keys.
```

```luau
local some_map = ty.map( ty.str(), ty.u8, ty.literal(3) ) -- Map will always have three keys.
```
