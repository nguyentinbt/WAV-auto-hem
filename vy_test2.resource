*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://the-internet.herokuapp.com/login
${BROWSER_NAME}    chrome
#${DEFAULT_BROWSER}    chrome 
${DEFAULT_USERNAME}    tomsmith
${DEFAULT_PASSWORD}    SuperSecretPassword!



*** Keywords ***
Open Chrome Browser
    #[Arguments]    ${URL}    ${BROWSER_NAME}=${DEFAULT_BROWSER}     
    Open Browser    ${URL}    ${BROWSER_NAME} 

Input username&password
    [Arguments]    ${USERNAME}=${DEFAULT_USERNAME}   ${PASSWORD}=${DEFAULT_PASSWORD}
    #Run Keyword If    ${USERNAME}==${NONE}  Input username&password  ${username}=${DEFAULT_USERNAME}
    Input Text    //*[@id="username"]    ${USERNAME}
    Input Text    //*[@id="password"]    ${PASSWORD} 

Click on Login button
    Click Button    //*[@id="login"]/button 

Is login successfully    
    Page Should Contain    Secure Area

Check Elements On The Login Page
    [Documentation]    This function is for logging in
    ${TEXT}=    Get Text    //*[@id="content"]/div/h4
    Should Contain    ${TEXT}    Welcome    
    Log    The text is found
 
Welcome page is openned
    Check Elements On The Login Page
 
  
    
