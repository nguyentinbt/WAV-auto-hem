*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://the-internet.herokuapp.com/login
${BROWSER_NAME}    chrome
${USERNAME}    tomsmith
${PASSWORD}    SuperSecretPassword!

*** Keywords ***
Open Chrome Browser
    Open Browser    ${URL}    ${BROWSER_NAME}  

Input username&password
    Input Text    //*[@id="username"]    ${USERNAME}
    Input Text    //*[@id="password"]    ${PASSWORD} 

Click on Login button
    Click Button    //*[@id="login"]/button 