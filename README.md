# Payconiq
Payconiq challenge

# Prerequisite
1. install cocoapods
```
sudo gem install cocoapods
```


# Setup project in Termial
1. change directory to the project root directory 
```
cd path/to/project/root/directory
```
2. run 
```
./init_project.sh
```
3. open Payconiq.xcworkspace

# Execute unit tests
1. change directory to the project root directory 
```
cd path/to/project/root/directory
```
2. run 
```
./ci_unit_tests.sh
```

# Execute UI tests
1. change directory to the project root directory
2. run 
```
./ci_ui_tests.sh
```

Note: UI tests are failing at the moment, and appears to be an XCUITest bug, where the accessibilty elements are present but
XCode UI test framework assertions are failing for some reason

# Dependencies
1. CollectionKit 2.3.0
2. RxViewController 0.4.0
   1. RxSwift
   2. RxCocoa
