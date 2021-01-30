
#!/bin/bash
sudo apt update && sudo apt install ccache
# Export
export ARCH="arm"
export SUBARCH="arm"
export PATH="/usr/lib/ccache:$PATH"
export KBUILD_BUILD_USER="iamlordutkarsh"
export KBUILD_BUILD_HOST="titan"
export device="cactus"
export LOCALVERSION="-Lord_Extended"
export kernel_repo="https://github.com/iamlordutkarsh/lord-reborn.git"
export tc_repo="https://github.com/wulan17/linaro_arm-linux-gnueabihf-7.5.git"
export tc_name="arm-linux-gnueabihf"
export tc_v="7.5"
export zip_name="kernel-""$device""-"$(env TZ='Asia/Jakarta' date +%Y%m%d)""
export KERNEL_DIR=$(pwd)
export KERN_IMG="$KERNEL_DIR"/kernel/out/arch/"$ARCH"/boot/zImage-dtb
export ZIP_DIR="$KERNEL_DIR"/AnyKernel
export CONFIG_DIR="$KERNEL_DIR"/kernel/arch/"$ARCH"/configs
export CORES=$(grep -c ^processor /proc/cpuinfo)
export THREAD="-j$CORES"
CROSS_COMPILE+="ccache "
CROSS_COMPILE+="$KERNEL_DIR"/"$tc_name"-"$tc_v"/bin/"$tc_name-"
export CROSS_COMPILE

	cd "$KERNEL_DIR" && git clone -b "$branch" "$kernel_repo" --depth 1 kernel
	cd "$KERNEL_DIR" && git clone "$tc_repo" "$tc_name"-"$tc_v"
	chmod -R a+x "$KERNEL_DIR"/"$tc_name"-"$tc_v"
	cd "$KERNEL_DIR"/kernel
	make  O=out "$device"_defconfig "$THREAD" > "$KERNEL_DIR"/kernel.log
	make "$THREAD" O=out >> "$KERNEL_DIR"/kernel.log
