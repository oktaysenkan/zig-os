const limine = @import("limine");
const colors = @import("colors.zig");
const console = @import("console.zig");

pub fn initialize(framebuffer: *limine.Framebuffer) void {
    const c = console.Console.init(framebuffer);

    c.fillScreen(colors.WHITE);
    c.drawRect(10, 10, 100, 100, colors.BLUE);
}
