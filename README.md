# zig-os

```bash
make KARCH=x86_64
qemu-system-x86_64 -cdrom template.iso -debugcon stdio -vga virtio -m 4G -machine "q35" -no-reboot -no-shutdown
```
