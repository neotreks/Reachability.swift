#!/usr/bin/env bash

set -eou pipefail

BUILD_DIRECTORY=${1:-"."}
echo "Temporary directory: $BUILD_DIRECTORY"

platforms=("iOS" "iOS Simulator")

# build for each platform

commands=()
for platform in "${platforms[@]}"
do
  xcodebuild archive \
    -scheme "Reachability" \
    -configuration Release \
    -archivePath "$BUILD_DIRECTORY/archives/Reachability-$platform.xcarchive" \
    -destination "generic/platform=$platform" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    SUPPORTS_MACCATALYST=YES

  commands+=("-archive" "$BUILD_DIRECTORY/archives/Reachability-$platform.xcarchive")
  commands+=("-framework" "Reachability.framework")

done

xcodebuild -create-xcframework "${commands[@]}" -output "$BUILD_DIRECTORY/Reachability.xcframework"

cp "LICENSE.md" "$BUILD_DIRECTORY/LICENSE.md"
cd "$BUILD_DIRECTORY"

ZIP_OUTPUT_PATH="Reachability.xcframework.zip"
rm -rf "$ZIP_OUTPUT_PATH"

zip --symlinks -r "$ZIP_OUTPUT_PATH" \
    Reachability.xcframework \
    LICENSE.md

CHECKSUM=$(swift package compute-checksum "$ZIP_OUTPUT_PATH")
echo "$CHECKSUM" > "xcframework_checksum.txt"
echo "Checksum: $CHECKSUM"
