# Output

[`#!luau light.output()`](./input.md) is a function which allows you to use light's internal deserialization on your own
[DynamicWriter](./writer/index.md). Usually after you've called [`#!luau light.input()`](./input.md) already.

## `#!luau function light.internal.output`

```luau title='<!-- errors --> <!-- client --> <!-- server --> <!-- shared --> <!-- experimental --> <!-- sync -->'
function output<Data>(
    writer: DynamicWriter,
    type: Datatype<Data>
): (Data)
```

You'll need to provide a valid [DynamicWriter](./writer/index.md), and [Datatype](../../datatypes/index.md#what-is-a-datatype). You can
serialize the data with [`#!luau light.input()`](./input.md).

!!! danger "Use correct data or `#!luau pcall()`"

    If the data is incorrect, this function may error.
