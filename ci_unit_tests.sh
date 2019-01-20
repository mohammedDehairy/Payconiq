#!/usr/bin/env bash
pod repo update
pod install
xcodebuild -workspace Payconiq.xcworkspace -scheme Payconiq -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.1' test
