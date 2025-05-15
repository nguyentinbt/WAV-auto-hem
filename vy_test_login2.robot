*** Settings ***
Library           SeleniumLibrary
Resource    vy_test2.resource


*** Test Cases ***
Open Web Browser and Input username & password to login
    Open Chrome Browser
    Input username&password    
    Sleep    10s
    #Is login successfully 
    Welcome page is openned
    