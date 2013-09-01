#!/bin/sh

set -e

. ./functions.shinc

require_standalone_toolchain

(cd src/boost &&
  ./b2 toolset=gcc-androidarmv7a abi=aapcs variant=release debug-symbols=on \
  threading=multi link=static -s NO_BZIP2=1 -j 4)

rm -rf ndk-modules/boost/include/* ndk-modules/boost/lib/armeabi-v7a/*

cp -a src/boost/boost ndk-modules/boost/include
cp src/boost/stage/lib/*.a ndk-modules/boost/lib/armeabi-v7a
ar cr ndk-modules/boost/lib/armeabi-v7a/dummy.a
