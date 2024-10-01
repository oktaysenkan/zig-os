const limine = @import("limine");
const console = @import("console.zig");

pub fn initialize(framebuffer: *limine.Framebuffer) void {
    const c = console.Console.init(framebuffer);

    const white: u32 = 0xFFFFFFFF;

    c.fillScreen(white);
    c.drawRect(10, 10, 100, 100, 0xFF0000FF);
}
