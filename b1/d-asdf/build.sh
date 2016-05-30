#!/usr/bin/env sh
dub build --compiler=ldmd2 --combined --build=release-nobounds --force --config=native-sse42
