*** Settings ***
Library            SeleniumLibrary
Resource          ../Common.Robot

*** Variables ***
${cart_item_prices}                       class:inventory_item_price
${remove_cart_btn}                        //button[text()='Remove']
${checkout_btn}                           id:checkout

*** Keywords ***
Remove item as per the price
    ${items}        Get WebElements    ${cart_item_prices}
    ${count}        Set Variable       ${0}
    FOR    ${item}    IN    @{items}
        ${price}            Get Text        ${item}
        ${price_value}      Evaluate        int(${price}[1:])    # Remove "$" and convert to integer
        ${count}            Evaluate        ${count}+${1}
        IF    ${price_value} >= 8 and ${price_value} <= 10   
            log             (${remove_cart_btn})[${count}]
            Click Element            xpath:(${remove_cart_btn})[${count}]
            BREAK
        END    
    END

Click on Checkout Button
    Click Element                    ${checkout_btn}