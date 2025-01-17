# Robot-Selenium-Automation

This repository contains automated test scripts for the Sauce Demo website using Robot Framework and SeleniumLibrary.

Getting Started
Follow these steps to set up and execute the test suite.

Prerequisites
* Python
* pip (Python package installer)
* Browser (e.g., Chrome, Firefox)
* Browser Driver:
  * ChromeDriver (for Chrome)

Installation
1. Clone the repository:
```   
  git clone https://github.com/your-repo-name.git
  cd your-repo-name
```
2. Install Required Libraries:
```
  pip install robotframework robotframework-seleniumlibrary
```
3. Ensure the browser driver is in your system PATH or specify its location in the scripts


# How to Execute

## Run All Tests

Execute the entire test suite:
```
robot Tests
```
##Run a Specific Test File

Run a particular test file:
```
robot Tests\LoginTests.robot
```

 ## View Test Reports: 
 
After execution, detailed logs and reports are generated in the Outputs directory:

* log.html: Detailed logs of the test run.
* report.html: Summary of test execution.

