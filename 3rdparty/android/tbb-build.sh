#!/bin/sh

set -e

. ./functions.shinc

require_standalone_toolchain

compiler_path=`which arm-linux-androideabi-g++`
sysroot=`dirname $compiler_path`/../sysroot

(cd src/tbb && make target=android arch=arm SYSROOT=$sysroot)

rm -rf ndk-mobules/tbb/include/*
rm -rf ndk-modules/tbb/lib/debug/armeabi-v7a/*
rm -rf ndk-modules/tbb/lib/release/armeabi-v7a/*

cp -a src/tbb/include/tbb ndk-modules/tbb/include
cp src/tbb/build/linux_arm_gcc_android_cc*_NDKunknown_kernelunknown_debug/*.so \
  ndk-modules/tbb/lib/debug/armeabi-v7a
cp src/tbb/build/linux_arm_gcc_android_cc*_NDKunknown_kernelunknown_release/*.so \
  ndk-modules/tbb/lib/release/armeabi-v7a
