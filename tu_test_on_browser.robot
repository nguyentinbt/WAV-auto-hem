*** Settings ***
Library           SeleniumLibrary
Resource    hook.resource


*** Test Cases ***
Open Web Browser and Input credentials to login
    Open Chrome Browser
    Input credentials
    Click on Login button