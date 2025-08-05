*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    https://demoqa.com/automation-practice-form
${BROWSER_NAME}    chrome
${SUBMIT_BUTTON}    //*[@id="submit"]
${FIRSTNAME_LOCATOR}    //*[@id="firstName"]
${LASTNAME_LOCATOR}    //*[@id="lastName"]
${EMAIL_LOCATOR}    //*[@id="userEmail"]
#${GENDER_LOCATOR}   //label[contains(text(),'Female')]
${MOBILE_LOCATOR}    //*[@id="userNumber"]
${DATEOFBIRTH_LOCATOR}    //*[@id="dateOfBirthInput"]
${SUBJECTS_LOCATOR}    //input[@id="subjectsInput"]
${HOBBIES_LOCATOR}    //label[contains(text(),'Reading')]    
${UPLOAD_PICTURE}    //*[@id="uploadPicture"]
${ADDRESS_LOCATOR}    //*[@id="currentAddress"]
${STATE_LOCATOR}    //*[@id="state"]/div/div[1]
${CITY_LOCATOR}    //*[@id="city"]/div/div[1]/div[1]
${CLOSE_BUTTON}    //button[@id="closeLargeModal"]

${PICTURE}    10.jpg 
${DOB}    	27 September,1997
${STAGE_CITY}    NCR Delhi
${SUBMIT_TITLE}    Thanks for submitting the form 


*** Keywords ***
Open Chrome Browser
    Open Browser    ${URL}    ${BROWSER_NAME} 

Input Firstname
    [Arguments]    ${FIRSTNAME}
    Input Text    ${FIRSTNAME_LOCATOR}    ${FIRSTNAME}
Input Lastname
    [Arguments]    ${LASTNAME}
    Input Text    ${LASTNAME_LOCATOR}    ${LASTNAME}

Input Email
    [Arguments]    ${EMAIL}
    Input Text    ${EMAIL_LOCATOR}    ${EMAIL}  

Select Gender
    [Arguments]    ${GENDER}
    Click Element    xpath=//label[text()='${GENDER}'] 
    #Click Element    ${GENDER_LOCATOR}   
    
Input Mobile Number
    [Arguments]    ${MOBILE}
    Input Text    ${MOBILE_LOCATOR}    ${MOBILE}   

Scroll Element To Center
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    ${element}=    Get WebElement    ${locator}
    Execute JavaScript    arguments[0].scrollIntoView({block: "center"});    ARGUMENTS    ${element}


Set Date Of Birth
    [Arguments]    ${DAY}    ${MONTH}    ${YEAR}
    Scroll Element To Center    ${DATEOFBIRTH_LOCATOR}
    Click Element    ${DATEOFBIRTH_LOCATOR}
    Select From List By Value    class=react-datepicker__month-select    ${MONTH}
    Select From List By Value    class=react-datepicker__year-select     ${YEAR}
    Click Element    xpath=//div[@class='react-datepicker__day react-datepicker__day--0${DAY}']

Input Subjects
    [Arguments]    ${SUBJECTS}
    Scroll Element To Center    ${SUBJECTS_LOCATOR}
    Click Element    ${SUBJECTS_LOCATOR}
    Input Text      ${SUBJECTS_LOCATOR}    $ {SUBJECTS}
    Press Keys    ${SUBJECTS_LOCATOR}    RETURN
    
Select Hobbies
    [Arguments]    @{HOBBIES_LIST}
    Scroll Element To Center    ${HOBBIES_LOCATOR}
    FOR    ${HOBBY}    IN    @{HOBBIES_LIST}
        Sleep    1s
        Click Element    xpath=//label[text()="${HOBBY}"]
    END

Get Full Picture File Path
    [Arguments]    ${PICTURE}
    ${file_path}=    Normalize Path    ${CURDIR}/vy_test_data/${PICTURE}
    RETURN    ${file_path}

Upload Picture
    [Arguments]    ${PICTURE}
    Scroll Element To Center    ${UPLOAD_PICTURE}
    ${file_path}    Get Full Picture File Path    ${PICTURE}
    Choose File    ${UPLOAD_PICTURE}    ${file_path}

Input Address
    [Arguments]    ${ADDRESS}
    Input Text    ${ADDRESS_LOCATOR}    ${ADDRESS}

Select State And City
    [Arguments]    ${STAGE}    ${CITY}
    Click Element    ${STATE_LOCATOR}
    Click Element    xpath=//div[text()="${STAGE}"]
    Click Element    ${CITY_LOCATOR}
    Click Element    xpath=//div[text()="${CITY}"]
     
Click on Submit button
    Scroll Element To Center    ${SUBMIT_BUTTON}
    Click Button    ${SUBMIT_BUTTON}
 
Verify the submit form full fill
    [Arguments]    ${SUBMIT_TITLE}    ${FIRSTNAME}    ${LASTNAME}    ${EMAIL}    ${GENDER}    ${MOBILE}    ${DOB}    ${SUBJECTS}    ${ADDRESS}    ${STAGE_CITY}    @{HOBBY}
    Table should contain inputed Submit Tilte    ${SUBMIT_TITLE}
    Table should contain inputed Firstname    ${FIRSTNAME}
    Table should contain inputed Lastname    ${LASTNAME}
    Table should contain inputed Email    ${EMAIL}
    Table should contain inputed Gender        ${GENDER}
    Table should contain inputed Mobile    ${MOBILE}
    Table should contain inputed Day of Birth    ${DOB}
    Table should contain inputed Subjects    ${SUBJECTS}
    Table should contain inputed Hobbies    @{HOBBY}
    Table should contain inputed Address     ${ADDRESS}
    Table should contain inputed Stage & City    ${STAGE_CITY}     
    
Table should contain inputed Submit Tilte
    [Arguments]    ${SUBMIT_TITLE}
    Page Should Contain    ${SUBMIT_TITLE}

Table should contain inputed Firstname
    [Arguments]    ${FIRST_NAME}
    Page Should Contain    ${FIRST_NAME}

Table should contain inputed Lastname
    [Arguments]    ${LAST_NAME}
    Page Should Contain    ${LAST_NAME}

Table should contain inputed Email
    [Arguments]    ${EMAIL}
    Page Should Contain    ${EMAIL}

Table should contain inputed Gender
    [Arguments]    ${GENDER}
    Page Should Contain    ${GENDER}

Table should contain inputed Mobile
    [Arguments]    ${MOBILE}
    Page Should Contain    ${MOBILE}

Table should contain inputed Day of Birth
    [Arguments]    ${DOB}
    Page Should Contain    ${DOB}

Table should contain inputed Subjects
    [Arguments]    ${SUBJECTS}
    Page Should Contain    ${SUBJECTS}

Table should contain inputed Hobbies
    [Arguments]    @{HOBBY}
    Page Should Contain    @{HOBBY}    

Table should contain inputed Address
    [Arguments]    ${ADDRESS}
    Page Should Contain    ${ADDRESS}

Table should contain inputed Stage & City
    [Arguments]    ${STAGE_CITY}
    Page Should Contain    ${STAGE_CITY}   

# TEST 2 - LEAVE THE REQUIRED FIELDS AS BLANK

# Verify the required fields in red
#     Missing Firstname
#     Missing Lastname
#     Missing Gender
#     Missing Mobile
# Get border color by ID
#     [Arguments]    ${elementID}
#     ${BORDER_COLOR}=    Execute JavaScript    return window.getComputedStyle(document.getElementById('${elementID}')).getPropertyValue('border-color');
#     Log    The border color: ${BORDER_COLOR}
#     RETURN    ${BORDER_COLOR}

# Missing Firstname
#     #${Fristname_border}=    Execute JavaScript    return window.getComputedStyle(document.getElementById('firstName')).getPropertyValue('border-color');
#     ${Fristname_border}=    Get border color by ID    firstName
#     Log    First name border color: ${Fristname_border}
#     Should Contain    ${Fristname_border}    rgb(220, 53, 69)

# Missing Lastname
#     ${Lastname_border}=    Get border color by ID    lastName
#     Log    Last name border color: ${Lastname_border}
#     Should Contain    ${Lastname_border}    rgb(220, 53, 69)   

# Missing Mobile
#     ${Mobile_border}=    Get border color by ID    userNumber
#     Log    Mobile border color: ${Mobile_border}
#     Should Contain    ${Mobile_border}    rgb(220, 53, 69)  

Verify the required fields will show in red
    @{required_fields}=    Create List    firstName    lastName    userNumber            
        FOR    ${id}    IN    @{required_fields}
            ${border_color}=    Execute JavaScript    return window.getComputedStyle(document.querySelector('#${id}')).getPropertyValue('border-color');
            Log    Gender color: ${border_color}
            Should Be Equal As Strings    ${border_color}    rgb(220, 53, 69)
        END
Verify the required radios will show in red
    @{gender_labels}=    Create List
    ...    genterWrapper > div.col-md-9.col-sm-12 > div:nth-child(1) > label
    ...    genterWrapper > div.col-md-9.col-sm-12 > div:nth-child(2) > label
    ...    genterWrapper > div.col-md-9.col-sm-12 > div:nth-child(3) > label
    FOR    ${label_selector}    IN    @{gender_labels}
        ${Gender_color}=    Execute Javascript    return window.getComputedStyle(document.querySelector('#${label_selector}')).getPropertyValue('color')
        Log    Gender color: ${Gender_color}
        Should Be Equal As Strings    ${Gender_color}    rgb(220, 53, 69)
    END