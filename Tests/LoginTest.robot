*** Settings ***
Library            SeleniumLibrary
Resource           ../Resources/Common.Robot
Suite Setup        Launch the Browser and Maximise Window    https://www.saucedemo.com     chrome
Suite Teardown     Close Browser

*** Test Cases ***
Login with Wrong Credentials
    [Documentation]        Verifies login functionality for invalid credentials.
    Enter Login Credentials And Click On Login    ${invalid_username}        ${invalid_password}
    Verify Login Error Message
 
Login With Correct Credentials
    [Documentation]        Verifies login functionality for valid credentials.
    Enter Login Credentials And Click On Login    ${valid_username}          ${valid_password}
    Verify User Is LoggedIn

Logout
    [Documentation]        Verifies the logout functionality.
    Click On Ham Icon
    Sleep                  2
    Click On Logout Button
    Sleep                  2
    Verify User Is Logged Out
