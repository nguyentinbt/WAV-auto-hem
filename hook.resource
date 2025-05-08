*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://the-internet.herokuapp.com/login
${USERNAME}    tomsmith
${PASSWORD}    SuperSecretPassword!

*** Keywords ***
Login With Position Arguments
    [Documentation]    This function is for logging in 
    [Arguments]    ${username_locator}    ${password_locator}    ${button_locator}    ${username}    ${password}
    Input Text     ${username_locator}    ${username}
    Input Text     ${password_locator}    ${password}
    Click Button   ${button_locator}


Open My Page
     [Arguments]    ${URL}    ${BROWSER}=chrome
     Log    URL: ${url}, Browser: ${browser}    
     Run Keyword If    '${BROWSER}' == '${NONE}'    Log    Browser is None    
     Run Keyword If    '${BROWSER}' == ''    Log    Browser is an empty string  
     Run Keyword If    '${BROWSER}' != '${NONE}' and '${BROWSER}' != ''    Open Browser     ${URL}    ${BROWSER}
  

    
