#!/usr/bin/env bash
function usage() {
  echo "usage: [-i|--init_project] [-s|unit_tests] [-t|--ui_test]"
  echo "  -i|--init_project      Initialize Project"
  echo "  -s|unit_tests          Run unit tests"
  echo "  -t|--ui_test           Run UI tests"
  exit 1
}
if [[ "$#" -eq 0 ]]; then
  usage
fi
init=false
run_ui_tests=false
run_unit_tests=false
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -i|--init_project )
    init=true
    shift
      ;;
    -t|--ui_test)
    run_ui_tests=true
    shift
    ;;
    -s|--unit_tests)
    run_unit_tests=true
    shift
    ;;
    *)
    usage
    ;;
  esac
done

if [[ "$init" = true ]]; then
  echo ---------------- Initializing Project ----------------
  ./init_project.sh
fi

if [[ "$run_unit_tests" = true ]]; then
  echo ---------------- Running Unit Tests ----------------
  xcodebuild -workspace Payconiq.xcworkspace -scheme Payconiq -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.1' test
fi

if [[ "$run_ui_tests" = true ]]; then
  echo ---------------- Running UI Tests ----------------
  xcodebuild -workspace Payconiq.xcworkspace -scheme PayconiqUITests -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.1' test
fi
