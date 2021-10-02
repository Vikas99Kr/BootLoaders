echo off
nasm -f bin boot.asm -o boot.bin
nasm -f bin space.asm -o disk_space.bin
cat boot.bin disk_space.bin > bootable.bin
dd if=bootable.bin of=bootable.img
qemu-system-i386 -fda bootable.img
echo on