# Strings

Represents a string value.

Includes an optional parameter for length which will default to
[`#!luau datatypes.vlq(3)`](./vlq.md#size-index).

The length datatype should NOT be a regular number—instead: use a
datatype that represents a number, like a [`uint`](../numbers/uints.md), or a
[`range`](./range.md#function-lightdatatypesrange).

## `#!luau function light.datatypes.str`

```luau title='<!-- shared --> <!-- sync -->'
function str(
    length: Datatype<number>?
): Datatype<string>
```

A couple of ways you could use the optional `length` parameter:

```luau
local ty = light.datatypes

local some_str = ty.str( ty.u8 ) -- length between 0-255
```

```luau
local some_str = ty.str( ty.range(0, 50) ) -- String should be between length 0 and 50.
```

```luau
local some_str = ty.str( ty.literal(3) ) -- A string of length 3.
```
