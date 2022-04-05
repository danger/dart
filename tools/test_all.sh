#!/bin/bash
cd "$(dirname "$0")"

cd ../packages

for sub_directory in */ ; do
    echo "[SCRIPT] Process directory: $sub_directory"
    cd $sub_directory
    
    echo "[SCRIPT] Run pub get"
    dart pub get

    if grep -q "build_runner" "pubspec.yaml"; then
        echo "[SCRIPT] Run build runner"
        dart pub run build_runner build --delete-conflicting-outputs
    fi
    
    echo "[SCRIPT] Run test"
    dart test

    cd ..
done

echo "[SCRIPT] Done"