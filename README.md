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

# Build script
1. run
```
./ci_build.sh
```
for usage

# Dependencies
1. CollectionKit 2.3.0
2. RxViewController 0.4.0
   1. RxSwift
   2. RxCocoa
   
# App architecture summary
- **RootViewController** is the root View Controller and it's responsible for:
  - The creation of individual Screens in the app and the transition between them, so that the navigation model between screens can be changed completely without touching the individual pages.
- Indivdual Page is built from multiple components:
  - **PageControlle**r: is the page high level controller object thats is responsible for the screen life cycle, handles user actions and render the page, contains:
    - **PageBuilder**: responsible for building all components that is needed for page rendering:
      - The **CollectionViewController** which is a UIViewController subclass which is treated as a dumb view that has very minimal logic.
      - **PageBuilder** also defines what list item views are supported.
        - Each individual list item view has Three objects that define how it is rendered:
          - **ViewBuilder**: responsible for view creation
          - **ViewLayouter**: responsible for layouting the view
          - **ViewModel**: dumb Model object the determins the raw data needed for the view rendering
        - The **DataSource**: is responsible for providing the ViewModel objects that defines the raw data to be presented with the help of:
          - **ViewModelParser**: responsible for parsing raw json from the backend in case the data comes from the remote backend, which is not necessarily the case the DataSource can provide static content as well.
        
