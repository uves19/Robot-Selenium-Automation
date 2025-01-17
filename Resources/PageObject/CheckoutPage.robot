*** Settings ***
Library            SeleniumLibrary
Resource          ../Common.Robot

*** Variables ***
${first_name}                           id:first-name
${last_name}                            id:last-name
${postal_code}                          id:postal-code
${continue_btn}                         id:continue
${total_amount}                         class:summary_total_label
${finish_btn}                           id:finish
${order_confirmation}                   class:complete-header
${order_confirmation_text}              Thank you for your order!

*** Keywords ***
Enter Personal Information
    # Wait until the first name input field is visible to ensure the form is loaded
    Wait Until Element Is Visible            ${first_name}
    # Enter the first name into the input field
    Input Text                               ${first_name}            Uves
    # Enter the last name into the input field
    Input Text                               ${last_name}             Akhtar
    # Enter the postal code into the input field
    Input Text                               ${postal_code}           251327
    # Pause for 2 seconds to ensure all inputs are processed
    Sleep                                    2

Click on Continue
    # Click on the "Continue" button to proceed to the payment summary
    Click Element                            ${continue_btn}
    
Print the Total Amount
    # Scroll to the total amount element to ensure it is visible on the screen
    Scroll Element Into View                 ${total_amount}
    # Log the total amount in the test logs for reference
    log                                      ${total_amount}
    # Log the total amount directly to the console for immediate visibility
    Log To Console                           ${total_amount}
    
Click On Finish Button
    # Click the "Finish" button to complete the checkout process
    Click Element                            ${finish_btn}

Verify Order is Placed
    # Wait until the order confirmation message is visible on the page
    Wait Until Element Is Visible            ${order_confirmation}
    # Verify that the order confirmation message matches the expected text
    Element Text Should Be                   ${order_confirmation}                ${order_confirmation_text}