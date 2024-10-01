const limine = @import("limine");

pub const Console = struct {
    framebuffer: *limine.Framebuffer,

    pub fn init(framebuffer: *limine.Framebuffer) Console {
        return Console{ .framebuffer = framebuffer };
    }

    pub fn setPixel(self: *const volatile @This(), x: usize, y: usize, color: u32) void {
        const pixel_offset = y * self.framebuffer.pitch + x * 4;
        @as(*u32, @ptrCast(@alignCast(self.framebuffer.address + pixel_offset))).* = color;
    }

    pub fn fillScreen(self: *const volatile @This(), color: u32) void {
        for (0..self.framebuffer.height) |y| {
            for (0..self.framebuffer.width) |x| {
                self.setPixel(x, y, color);
            }
        }
    }

    pub fn drawRect(self: *const volatile @This(), x: usize, y: usize, width: usize, height: usize, color: u32) void {
        for (0..height) |dy| {
            for (0..width) |dx| {
                self.setPixel(x + dx, y + dy, color);
            }
        }
    }
};
