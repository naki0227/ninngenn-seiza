#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "== Swift format/lint =="
swift format lint --strict --recursive App Packages/GameCore/Sources Packages/GameCore/Tests

echo "== Swift Package tests =="
swift test --package-path Packages/GameCore

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "SKIPPED: iOS simulator build requires macOS + Xcode."
  exit 0
fi

if ! command -v xcodegen >/dev/null 2>&1; then
  echo "ERROR: Install XcodeGen first: brew install xcodegen" >&2
  exit 1
fi

echo "== Xcode project generation =="
xcodegen generate
echo "== iOS simulator build =="
xcodebuild -project NinngennSeiza.xcodeproj \
  -scheme NinngennSeiza \
  -configuration Debug \
  -sdk iphonesimulator \
  -destination 'generic/platform=iOS Simulator' \
  CODE_SIGNING_ALLOWED=NO build
