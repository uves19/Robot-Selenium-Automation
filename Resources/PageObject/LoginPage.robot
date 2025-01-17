*** Settings ***
Library            SeleniumLibrary
Resource          ../Common.Robot

*** Variables ***
${url}                    https://www.saucedemo.com/
${browser}                chrome
${username_field}         xpath=//input[@placeholder='Username']
${password_field}         xpath=//input[@placeholder='Password']
${login_button}           xpath=//input[@value='Login']
${valid_username}         standard_user
${valid_password}         secret_sauce
${invalid_username}       invalid_user
${invalid_password}       wrong_password
${success_page_url}       https://www.saucedemo.com/inventory.html
${error_element}          xpath=//h3[@data-test='error']
${expected_error_text}    Epic sadface: Username and password do not match any user in this service

*** Keywords ***
Enter Login Credentials and Click on Login
    [Arguments]    ${username}    ${password}
    # Wait until the username field is visible to ensure the page is fully loaded
    Wait Until Element Is Visible    ${username_field}
    # Enter the provided username into the username field
    Input Text      ${username_field}    ${username}
    # Enter the provided password into the password field
    Input Text      ${password_field}    ${password}
    # Click on the login button to attempt login
    Click Button    ${login_button}


Verify Login Error Message
    # Wait until the error message element is visible on the page
    Wait Until Element Is Visible    ${error_element}    timeout=5 seconds
    # Retrieve the text of the error message
    ${error_message_text}            Get Text            ${error_element}
    # Verify that the retrieved error message matches the expected error text
    Should Be Equal As Strings       ${error_message_text}    ${expected_error_text}

Verify User is LoggedIn
    # Verify that the current URL matches the expected success page URL
    Wait Until Location Is         ${success_page_url}

Verify User is Logged Out
    # Verify that the user is redirected to the login page URL after logging out
    Wait Until Location Is        ${url}

Launch Browser And LogIn
    # Launch the browser, open the specified URL, and maximize the browser window
    Launch The Browser And Maximise Window            ${url}                   ${browser}
    # Log in using valid credentials
    Enter Login Credentials And Click On Login        ${valid_username}        ${valid_password}
    # Verify that the user has successfully logged in
    Verify User Is LoggedIn
    