# zig-os

This project is a simple operating system template written in Zig, designed to be used with the Limine bootloader. It serves as a starting point for those interested in OS development, providing a minimal setup to build upon.

Features:

- Basic bootloader setup with Limine
- Minimal kernel written in Zig
- Example build and run instructions using `make` and `qemu`

## Screenshots

|                                         **Bootloader**                                         |                                         **zig-os**                                         |
| :--------------------------------------------------------------------------------------------: | :----------------------------------------------------------------------------------------: |
| ![Bootloader](https://github.com/user-attachments/assets/7e9163aa-e0cd-48b5-ab1b-549c7bc970b3) | ![zig-os](https://github.com/user-attachments/assets/010f9702-88bc-4b55-96b3-069206def94f) |

## Building

```bash
make KARCH=x86_64
qemu-system-x86_64 -cdrom template.iso -debugcon stdio -vga virtio -m 4G -machine "q35" -no-reboot -no-shutdown
```
