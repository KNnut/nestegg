# nestegg

[nestegg](https://github.com/mozilla/nestegg) on the [Zig Build System](https://ziglang.org/learn/build-system/).

## Usage

Add this package to `build.zig.zon`:

```sh
zig fetch --save git+https://github.com/KNnut/nestegg
```

And then import `nestegg` in `build.zig` with:

```zig
const nestegg_dep = b.dependency("nestegg", .{
    .target = target,
    .optimize = optimize,
});
exe.root_module.linkLibrary(nestegg_dep.artifact("nestegg"));
```
