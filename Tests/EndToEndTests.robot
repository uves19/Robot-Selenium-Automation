*** Settings ***
Library            SeleniumLibrary
Resource           ../Resources/Common.Robot
Suite Setup        Launch Browser And LogIn
Suite Teardown     Close Browser

*** Test Cases ***
Add Items From Inventory Page
    [Documentation]        Verifies the functionality of adding items to the cart directly from the inventory page.
    ...                    1. Applies a price filter (low to high) to sort the inventory items in ascending order of price.
    ...                    2. Selects and adds the "Sauce Labs Onesie" to the cart.
    ...                    3. Selects and adds the "Sauce Labs Backpack" to the cart.
    ...                    4. Verifies that the cart count updates correctly to reflect the number of items added.
    Select Low To High Filter
    Sleep                      2
    Add Product To Cart        Sauce Labs Onesie
    Sleep                      2
    Add Product To Cart        Sauce Labs Backpack
    Sleep                      1
    Verify The Cart Count      2
    Sleep                      2

Add Items from Product Page
    [Documentation]        Verifies the functionality of adding an item to the cart from the product details page.
    ...                    1. Navigates to the product details page for "Sauce Labs Bike Light."
    ...                    2. Adds the item to the cart directly from the product details page.
    ...                    3. Verifies that the cart count updates correctly to reflect the addition of the item, ensuring it shows 3 items in the cart.

    Open The Product Details Page                Sauce Labs Bike Light
    Add Product to Cart From Inventory Item Details Page
    Sleep                                        2
    Verify The Cart Count                        3
    Sleep                                        2

Remove Item from Cart
    [Documentation]        Verifies the functionality of removing an item from the cart based on its price.
    ...                    1. Opens the cart page to view all items added to the cart.
    ...                    2. Removes an item from the cart whose price falls within a specific range (e.g., $8-$10).
    ...                    3. Verifies that the cart count updates correctly to reflect the number of remaining items in the cart, ensuring it shows 2 items.
    Open Cart
    Sleep                                        2
    Remove Item As Per The Price
    Sleep                                        2
    Capture Page Screenshot
    Verify The Cart Count                        2
    Sleep                                        2

Placing Order (Checkout Workflow)
    [Documentation]        Verifies the end-to-end checkout workflow, ensuring an order can be placed successfully.
    ...                    1. Clicks the "Checkout" button to initiate the checkout process.
    ...                    2. Enters the required personal information, including first name, last name, and postal code.
    ...                    3. Proceeds to the next step by clicking the "Continue" button.
    ...                    4. Prints the total amount displayed in the order summary for verification purposes.
    ...                    5. Completes the order by clicking the "Finish" button.
    ...                    6. Verifies that the order placement was successful, ensuring the confirmation message is displayed.
    Click On Checkout Button
    Enter Personal Information

    Click On Continue
    Sleep                   2
    Print The Total Amount
    Click On Finish Button
    Verify Order Is Placed
    
Logout
    [Documentation]        Verifies the functionality of logging out from the application.
    ...                    1. Opens the hamburger menu to access additional options.
    ...                    2. Clicks on the "Logout" button to log the user out of the application.
    ...                    3. Verifies that the user is redirected to the login page after logging out, ensuring the logout process is successful.
    Click On Ham Icon
    Sleep                     2
    Click On Logout Button
    Sleep                     2
    Verify User Is Logged Out
    Sleep                     2