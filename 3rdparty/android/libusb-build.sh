#!/bin/sh

set -e

. ./functions.shinc

require_standalone_toolchain

(cd src/libusb/android && bash build.sh armeabi-v7a)

rm -rf ndk-modules/libusb-1.0
cp -a src/libusb/android/ndk-modules/libusb-1.0 ndk-modules
