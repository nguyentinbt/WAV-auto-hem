*** Settings ***
Library           SeleniumLibrary
Resource    hook.resource


*** Test Cases ***
Login Test On Default Browser
    Open My Page    ${URL}    
    Login With Position Arguments
    ...    //*[@id="username"]
    ...    //*[@id="password"]
    ...    //*[@id="login"]/button
    ...    tomsmith
    ...    SuperSecretPassword!
    Sleep    10s
    ${TEXT}=    Get Text    //*[@id="content"]/div/h4
    Should Contain    ${TEXT}    Welcome  

Login Test On Custom Browser
    Open My Page    ${URL}    Firefox    
    Login With Position Arguments
    ...    //*[@id="username"]
    ...    //*[@id="password"]
    ...    //*[@id="login"]/button
    ...    tomsmith
    ...    SuperSecretPassword!
    Sleep    10s
    ${TEXT}=    Get Text    //*[@id="content"]/div/h4
    Should Contain    ${TEXT}    Welcome

Login Test On Empty Browser
    Open My Page    ${URL}    ${NONE}