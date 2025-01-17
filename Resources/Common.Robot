*** Settings ***
Library            SeleniumLibrary
Resource           PageObject/LoginPage.robot
Resource           PageObject/InventoryPage.robot
Resource           PageObject/CartPage.robot
Resource           PageObject/CheckoutPage.robot

*** Variables ***
${ham_icon}            id:react-burger-menu-btn
${logout_btn}          id:logout_sidebar_link

*** Keywords ***
Launch the Browser and Maximise Window
    [Arguments]        ${url}        ${browser_name}
    # Open the specified URL in the provided browser
    Open Browser        ${url}        ${browser_name}
    # Maximize the browser window to ensure all elements are visible
    Maximize Browser Window

Click on Ham Icon
    # Wait until the hamburger menu icon is visible to ensure it can be interacted with
    Wait Until Element Is Visible            ${ham_icon}
    # Click on the hamburger menu icon to open the menu options
    Click Element                            ${ham_icon}
    
Click on Logout Button
    # Wait until the logout button is visible in the menu
    Wait Until Element Is Visible            ${logout_btn}
    # Click on the logout button to log out the user
    Click Element                            ${logout_btn}