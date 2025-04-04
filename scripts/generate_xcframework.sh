#!/bin/bash
set -e

# Compile static libraries

# ARM64 Device
scons target=$2 arch=arm64 plugin=$1
# x86_64 Simulator
scons target=$2 arch=x86_64 simulator=yes plugin=$1
# ARM64 Simulator
scons target=$2 arch=arm64 simulator=yes plugin=$1

# Creating a fat libraries for device and simulator
# lib<plugin>.<arch>-<simulator|ios>.<release|debug|release_debug>.a
lipo -create "./bin/lib$1.x86_64-simulator.$2.a" "./bin/lib$1.arm64-simulator.$2.a" -output "./bin/$1-simulator.$2.a"
lipo -create "./bin/lib$1.arm64-ios.$2.a" -output "./bin/$1-device.$2.a"

# Creating a xcframework 
xcodebuild -create-xcframework \
    -library "./bin/$1-device.$2.a" \
    -library "./bin/$1-simulator.$2.a" \
    -output "./bin/$1.$2.xcframework"
