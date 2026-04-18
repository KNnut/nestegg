const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "nestegg",
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });

    const upstream_dep = b.dependency("nestegg", .{
        .target = target,
        .optimize = optimize,
    });

    lib.root_module.addCSourceFile(.{
        .language = .c,
        .file = upstream_dep.path("src/nestegg.c"),
    });
    lib.root_module.addIncludePath(upstream_dep.path("include"));

    lib.installHeader(upstream_dep.path("include/nestegg/nestegg.h"), "nestegg/nestegg.h");
    b.installArtifact(lib);
}
