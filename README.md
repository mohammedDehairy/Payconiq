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
./ci_build.sh -i
```
or 
```
./ci_build.sh --init_project
```
3. open Payconiq.xcworkspace

# Execute unit tests
1. change directory to the project root directory 
```
cd path/to/project/root/directory
```
2. run 
```
./ci_build.sh -s
```
or 
```
./ci_build.sh --unit_tests
```
Note: unit test classes are added underneath the class that it tests in the project

# Execute UI tests
1. change directory to the project root directory
2. run 
```
./ci_build.sh -t
```
or 
```
./ci_build.sh --ui_test
```

Note: UI tests are failing at the moment, and appears to be an XCUITest bug, where the accessibilty elements are present but
XCode UI test framework assertions are failing for some reason

# Dependencies
1. CollectionKit 2.3.0
2. RxViewController 0.4.0
   1. RxSwift
   2. RxCocoa
