*** Settings ***
Resource            ../configurations/configs.resource

*** Variables ***
${USERNAME_LOCATOR}    //*[@id="username"]
${PASSWORD_LOCATOR}    //*[@id="password"]
${USERNAME}    tomsmith
${PASSWORD}    SuperSecretPassword!
${LOGIN_BUTTON}    //*[@id="login"]/button


*** Test Cases ***
Login Test On Default Browser
    Open My Page    ${URL}    
    Login With Position Arguments
    ...    ${USERNAME_LOCATOR}    
    ...    ${PASSWORD_LOCATOR}   
    ...    ${LOGIN_BUTTON}     
    ...    ${USERNAME}    
    ...    ${PASSWORD}    
    Welcome page is openned









    









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