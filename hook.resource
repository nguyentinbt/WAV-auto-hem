*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://the-internet.herokuapp.com/login
${BROWSER_NAME}    chrome
${USERNAME}    tomsmith
${PASSWORD}    SuperSecretPassword!

*** Keywords ***
Login With Flexible Locators
    [Documentation]    This function is for logging in 
    [Arguments]    ${username_locator}    ${password_locator}    ${button_locator}    ${username}    ${password}
    Input Text     ${username_locator}    ${username}
    Input Text     ${password_locator}    ${password}
    Click Button   ${button_locator}
