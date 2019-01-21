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

**you may need to add execution permissions to the ci_build.sh shell script**

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
Notes:
- **unit test classes are added underneath the class that it tests in the project**
- **you may need to add execution permissions to the ci_build.sh shell script**

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

Notes
- **UI tests are failing at the moment, and appears to be an XCUITest bug, where the accessibilty elements are present but
XCode UI test framework assertions are failing for some reason**
- **you may need to add execution permissions to the ci_build.sh shell script**

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
- Individual Page is built from multiple components:
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
          
- **Room for improvements**
  - At the moment the list view's styling (fonts, colors, images, margins and spaces) are determined by both the ViewBuilder and the ViewLayouter, and some times even duplicated between them which results in coupling - if styling changes both has to be changed -.
  - So would be greate to encapsulate the styles in a Style object that determine all the styles in one place and both the ViewBuilder and ViewLayouter follow blindly the Style object, And there would be a StyleBuilder object that builds the Style object.
- Not to mention that the UI is ugly, and needs a UI/UX designer's touch, visual design is my weak area :-).
- HTTP requests are made in each DataSource object, would be nice to have like a gateway to make all backend calls, to handle authentication/authorization/persistent-caching/synchronisation between calls in one place.
