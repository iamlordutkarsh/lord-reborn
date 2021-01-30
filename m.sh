export ARCH="arm"
export SUBARCH="arm"
export KBUILD_BUILD_USER="iamlordutkarsh"
export KBUILD_BUILD_HOST="titan"
export CROSS_COMPILE=/home/ubuntu/cactus/kernel/arm-linux-gnueabihf-7.5/bin/arm-linux-gnueabihf-
make cactus_defconfig O=out
make -j$(grep -c ^processor /proc/cpuinfo) O=out
