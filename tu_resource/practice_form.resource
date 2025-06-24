*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${DEMOQA_URL}    https://demoqa.com/automation-practice-form
${FIRST_NAME_FIELD}    //*[@id="firstName"]
${LAST_NAME_FIELD}    //*[@id="lastName"]
${EMAIL_FIELD}    //*[@id="userEmail"]
${FEMALE_GENDER_OPTION}    //label[contains(text(), 'Female')]
${MOBILE_FIELD}    //*[@id="userNumber"]
${DATE_OF_BIRTH_FIELD}    //*[@id="dateOfBirthInput"]
${SUBJECT_FIELD}    //*[@id="subjectsInput"]
${MUSIC_HOBBIES_OPTION}    //label[contains(text(), 'Music')]
${UPLOAD_PICTURE_BUTTON}    //*[@id="uploadPicture"]
${CURRENT_ADDRESS_FIELD}    //*[@id="currentAddress"]
${SELECT_STATE_DROPDOWN}    //*[@id="state"]
${SELECT_CITY_DROPDOWN}    //*[@id="city"]
${SUBMIT_BUTTON}    //*[@id="submit"]
${DATE}       //*[@id="dateOfBirth"]/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div[3]
${MONTH}      June
${YEAR}       2025
${LAST_PAGE_ELEMENT}    //*[@id="app"]/div/div/div/div[2]/div[3]


*** Keywords ***
Open Practice Form
    [Documentation]    This function is for opening the website 
    Open Browser    ${DEMOQA_URL}    chrome
    Maximize Browser Window

Input Name
    [Documentation]    This function is for inputting name
    [Arguments]     ${first_name}    ${last_name}
    Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Input Text    ${LAST_NAME_FIELD}    ${last_name}

Input Email
    [Documentation]    This function is for inputting email
    [Arguments]     ${email} 
    Input Text    ${EMAIL_FIELD}    ${email}

Select Gender
    [Documentation]    This function is for selecting gender
    Click Element    ${FEMALE_GENDER_OPTION}  

Input Mobile
    [Documentation]    This function is for inputting mobile
    [Arguments]     ${mobile} 
    Input Text    ${MOBILE_FIELD}    ${mobile}  

Scroll To The End Of The Page
    [Documentation]    This function is for scrolling to the end of the page
    Scroll Element Into View    ${LAST_PAGE_ELEMENT}

Input Subject
    [Documentation]    This function is for inputting subject
    [Arguments]     ${subject}
    Input Text    ${SUBJECT_FIELD}    ${subject}
    Press Keys    ${SUBJECT_FIELD}    RETURN

Select Hobbies
    [Documentation]    This function is for selecting hobbies
    Click Element    ${MUSIC_HOBBIES_OPTION}

Select Picture
    [Documentation]    This function is for selecting picture
    ${file_path}=       Get file path    picture.jpg
    Choose File    ${UPLOAD_PICTURE_BUTTON}    ${file_path}
Get file path 
    [Documentation]    Get file path of the picture
    [Arguments]    ${filename}
    ${raw_path}=    Set Variable    ${CURDIR}\\..\\tu_test_data\\${filename}
    ${file_path}=    Normalize Path    ${raw_path}
    RETURN     ${file_path}
Input Address
    [Documentation]    This function is for inputting address
    [Arguments]     ${address} 
    Input Text    ${CURRENT_ADDRESS_FIELD}    ${address}
    
Select State
    [Documentation]    This function is for selecting state
    Click Element    ${SELECT_STATE_DROPDOWN}
    Click Element   xpath=//div[text()="Haryana"]

Select City
    [Documentation]    This function is for selecting city
    Click Element    ${SELECT_CITY_DROPDOWN}
    Click Element   xpath=//div[text()="Karnal"]
    
Select Date
    [Documentation]    Select Date From Custom Calendar
    Click Element    ${DATE_OF_BIRTH_FIELD}
    Click Element    //select[@class='react-datepicker__month-select']//option[text()='${MONTH}']
    Click Element    //select[@class='react-datepicker__year-select']//option[text()='${YEAR}']
    Click Element    ${DATE}

Submit Practice Form
    [Documentation]    This function is for submitting form               
    Click Button   ${SUBMIT_BUTTON}

Verify the submited form
    [Documentation]    Verify the submited form
    [Arguments]     ${form_title}    ${first_name}    ${last_name}    ${email}     ${gender}    ${mobile}    ${date_of_birth}    ${subject}    ${hobbies}    ${picture}     ${address}    ${state_city}
    Verify Title    ${form_title}
    Verify Name    ${first_name}    ${last_name}  
    Verify Email    ${email}
    Verify Gender    ${gender}
    Verify Mobile    ${mobile} 
    Verify DOB    ${date_of_birth}
    Verify Subject    ${subject}
    Verify Hobbies    ${hobbies} 
    Verify Picture    ${picture} 
    Verify Address    ${address}
    Verify State And City    ${state_city}

Verify Title
    [Arguments]     ${form_title}
    Page Should Contain    ${form_title}
Verify Name
    [Arguments]     ${first_name}    ${last_name}  
    Page Should Contain    ${first_name}
    Page Should Contain    ${last_name}

Verify Email
    [Arguments]     ${email}
    Page Should Contain    ${email}

Verify Gender
    [Arguments]     ${gender}
    Page Should Contain    ${gender}

Verify Mobile
    [Arguments]    ${mobile} 
    Page Should Contain    ${mobile} 

Verify DOB
    [Arguments]    ${date_of_birth}
    Page Should Contain    ${date_of_birth}

Verify Subject
    [Arguments]    ${subject}
    Page Should Contain    ${subject}

Verify Hobbies
    [Arguments]    ${hobbies}
    Page Should Contain    ${hobbies}

Verify Picture
    [Arguments]    ${picture} 
    Page Should Contain    ${picture} 

Verify Address
    [Arguments]    ${address}
    Page Should Contain    ${address}

Verify State And City
    [Arguments]    ${state_city}
    Page Should Contain    ${state_city}

Verify that the required fields will be red-highlighted
    @{fields}=    Create List    firstName    lastName    userNumber    
    # Get border color of the field
    FOR    ${id}    IN    @{fields}
        ${border}=    Execute Javascript    return window.getComputedStyle(document.querySelector('#${id}')).getPropertyValue('border-color')
        Log    Border Color: ${border}
        Should Be Equal As Strings    ${border}    rgb(220, 53, 69)
    END

Verify that the required radios will be red-highlighted
    @{gender_labels}=    Create List
    ...    genterWrapper > div.col-md-9.col-sm-12 > div:nth-child(1) > label
    ...    genterWrapper > div.col-md-9.col-sm-12 > div:nth-child(2) > label
    ...    genterWrapper > div.col-md-9.col-sm-12 > div:nth-child(3) > label
    # Get border color of the radio
    FOR    ${label_selector}    IN    @{gender_labels}
        ${border}=    Execute Javascript    return window.getComputedStyle(document.querySelector('#${label_selector}')).getPropertyValue('color')
        Log    Border Color: ${border}
        Should Be Equal As Strings    ${border}    rgb(220, 53, 69)
    END
