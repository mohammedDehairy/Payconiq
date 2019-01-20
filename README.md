# Payconiq
Payconiq challenge

# Setup project in Termial
1. change directory to the project root directory 
2. run ./init_project.sh

# Execute unit tests
1. change directory to the project root directory 
2. run ./ci_unit_tests.sh

# Execute UI tests
1. change directory to the project root directory
2. run ./ci_ui_tests.sh
Note: UI tests are failing at the moment, and appears to be an XCUITest bug, where the accessibilty elements are present but
XCode UI test framework assertions are failing for some reason
