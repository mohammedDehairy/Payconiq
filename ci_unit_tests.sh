#!/usr/bin/env bash
./init_project.sh
xcodebuild -workspace Payconiq.xcworkspace -scheme Payconiq -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.1' test
