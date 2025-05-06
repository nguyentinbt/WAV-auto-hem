*** Settings ***
Library           SeleniumLibrary
Resource    vy_test.resource


*** Test Cases ***
Open Web Browser and Input username & password to login
    Open Chrome Browser
    Input username&password
    Click on Login button