#!/usr/bin/env bash
xcodebuild -workspace Payconiq.xcworkspace -scheme PayconiqUITests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.1' test
