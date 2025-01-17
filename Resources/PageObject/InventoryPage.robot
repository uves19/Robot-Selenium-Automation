*** Settings ***
Library            SeleniumLibrary
Resource          ../Common.Robot

*** Variables ***
${inventory_filter}                       class:product_sort_container
${filter}                                 lohi
${cart_icon}                              class:shopping_cart_link
${item_count}                             //span[@class='shopping_cart_badge']
${add_cart_button}                        id:add-to-cart


*** Keywords ***
Select Low to High Filter
    # Wait until the inventory filter element is visible before interacting with it
    Wait Until Element Is Visible        ${inventory_filter}
    # Select the "Low to High" filter option from the dropdown list
    Select From List By Value            ${inventory_filter}        ${filter}
    # Pause for 2 seconds to allow the filtering action to complete
    Sleep                                2

Add Product To Cart
    [Arguments]            ${product_name}
    # Dynamically create the XPath for the "Add to Cart" button based on the product name
    ${add_to_card_btn}        Set Variable            //div[text()='${product_name}']//following::button[1]
    # Scroll to the "Add to Cart" button to ensure it's visible in the viewport
    Scroll Element Into View                          ${add_to_card_btn}
    # Click the "Add to Cart" button to add the specified product to the cart
    Click Button                                      ${add_to_card_btn}
    # Pause for 2 seconds to account for the action delay
    Sleep                                             2
    
Verify the Cart Count
    [Arguments]            ${count}
    # Scroll to the cart icon to ensure it is visible
    Scroll Element Into View                     ${item_count}
    # Retrieve the current count of items in the cart
    ${cart_count}            Get Text            ${item_count}
    # Verify that the cart count matches the expected count
    Should Be Equal As Numbers        ${cart_count}        ${count}
    
Open the Product Details Page
    [Arguments]            ${product_name}
    # Click on the product name to open its details page
    Click Element          //div[text()='${product_name}']

Add Product to Cart From Inventory Item Details Page
    # Wait until the "Add to Cart" button is visible on the product details page
    Wait Until Element Is Visible                ${add_cart_button}
    # Click the "Add to Cart" button on the product details page
    Click Element                                ${add_cart_button}
    # Pause for 3 seconds to account for the action delay
    Sleep                                        3

Open Cart
    # Wait until the cart icon is visible
    Wait Until Element Is Visible                ${cart_icon}
    # Click on the cart icon to navigate to the cart page
    Click Element                                ${cart_icon}




    