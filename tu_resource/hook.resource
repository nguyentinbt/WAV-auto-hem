*** Settings ***
Library    SeleniumLibrary
Resource    ../tu_tests/tu_test_on_browser.robot

*** Variables ***
${URL}    https://the-internet.herokuapp.com/login


*** Keywords ***
Open My Page
    [Documentation]    This function is for opening the website 
     [Arguments]    ${URL}    ${BROWSER}=chrome
     Log    URL: ${url}, Browser: ${browser}    
     Run Keyword If    '${BROWSER}' == '${NONE}'    Log    Browser is None    
     Run Keyword If    '${BROWSER}' == ''    Log    Browser is an empty string  
     Run Keyword If    '${BROWSER}' != '${NONE}' and '${BROWSER}' != ''    Open Browser     ${URL}    ${BROWSER}

Login With Position Arguments
    [Documentation]    This function is for logging in 
    [Arguments]    ${username_locator}    ${password_locator}    ${button_locator}    ${username}    ${password}
    Input Text     ${username_locator}    ${username}
    Input Text     ${password_locator}    ${password}
    Click Button   ${button_locator}
    Sleep    10s

Check Elements On The Login Page
    [Documentation]    This function is for logging in 
    ${TEXT}=    Get Text    //*[@id="content"]/div/h4
    Should Contain    ${TEXT}    Welcome    
    Log    The text is found

Welcome page is openned
    Check Elements On The Login Page


  

    
