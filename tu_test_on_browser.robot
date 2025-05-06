*** Settings ***
Library           SeleniumLibrary
Resource    hook.resource


*** Test Cases ***
Flexible Login Test 
    Open Browser    ${URL}    chrome
    Login With Flexible Locators
    ...    //*[@id="username"]
    ...    //*[@id="password"]
    ...    //*[@id="login"]/button
    ...    tomsmith
    ...    SuperSecretPassword!
    Sleep    10s
    ${TEXT}=    Get Text    //*[@id="content"]/div/h4
    Should Contain    ${TEXT}    Welcome    