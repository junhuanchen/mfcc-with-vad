
cmake_minimum_required(VERSION 3.15)

# source /opt/v83x_linux_x86_python3.8_toolchain/envsetup.sh
set(CMAKE_C_COMPILER "/opt/v83x_linux_x86_python3.8_toolchain/toolchain-sunxi-musl/toolchain/bin/arm-openwrt-linux-gcc")
set(CMAKE_CXX_COMPILER "/opt/v83x_linux_x86_python3.8_toolchain/toolchain-sunxi-musl/toolchain/bin/arm-openwrt-linux-g++")
set(CMAKE_VERBOSE_MAKEFILE on)

# 项目信息
project(mfcc)

include_directories("${PROJECT_SOURCE_DIR}/include")

aux_source_directory(./src DIR_SRCS)
aux_source_directory(./src/signal_processing DIR_SRCS)
aux_source_directory(./src/vad DIR_SRCS)

aux_source_directory(./main DIR_SRCS)

message("DIR_SRCS:" ${DIR_SRCS})

# 指定生成目标
add_executable(mfcc ${DIR_SRCS} ./main/main.c)

target_link_libraries(mfcc m asound pthread)
