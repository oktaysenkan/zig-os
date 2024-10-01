const builtin = @import("builtin");
const limine = @import("limine");
const std = @import("std");
const bootstrap = @import("bootstrap.zig");

pub export var framebuffer_request: limine.FramebufferRequest = .{};

pub export var base_revision: limine.BaseRevision = .{ .revision = 2 };

inline fn done() noreturn {
    while (true) {
        switch (builtin.cpu.arch) {
            .x86_64 => asm volatile ("hlt"),
            .aarch64 => asm volatile ("wfi"),
            .riscv64 => asm volatile ("wfi"),
            else => unreachable,
        }
    }
}

export fn _start() callconv(.C) noreturn {
    if (!base_revision.is_supported()) {
        done();
    }

    if (framebuffer_request.response) |framebuffer_response| {
        if (framebuffer_response.framebuffer_count < 1) {
            done();
        }

        const framebuffer = framebuffer_response.framebuffers()[0];

        bootstrap.initialize(framebuffer);
    }

    done();
}
