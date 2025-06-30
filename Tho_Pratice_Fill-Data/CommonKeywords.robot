*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Resource    ../Tho_Pratice_Fill-Data/CommonVariables.robot
*** Variables ***
#${first_name_result}    ${EMPTY}
#${last_name_result}    ${EMPTY}
   

*** Keywords ***
Open the Demoqa page
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Input the Name
    [Arguments]    ${first_name}    ${last_name}
    Input Text    ${FIRST_NAME_LO}    ${first_name}
    Input Text    ${LAST_NAME_LO}    ${last_name}
    Set Suite Variable    ${first_name_result}    ${first_name}
    Set Suite Variable    ${last_name_result}    ${last_name}


Input the Email 
    [Arguments]    ${email}
    Input Text    ${EMAIL_LO}    ${email}
    Set Suite Variable    ${email_result}    ${email}


Choose the Gender
    [Arguments]    ${gender}
    Click Element    xpath=//label[@class='custom-control-label' and contains(text(), '${gender}')]
    #${d}=    Get Text    xpath=//label[@class='custom-control-label' and contains(text(), '${gender}')]  
    Set Suite Variable    ${gender_result}    ${gender}

Input the Mobile
    [Arguments]    ${mobile}
    Input Text    ${MOBILE_LO}    ${mobile}
    Set Suite Variable    ${mobile_result}    ${mobile}


Select date of birth
    [Arguments]    ${day}    ${month}    ${year}
    Click Element    ${CHOOSE_YOUR_BIRTH_LO}
    Press Keys       ${CHOOSE_YOUR_BIRTH_LO}  CTRL+A    ${day} ${month} ${year}
    Press Keys       ${CHOOSE_YOUR_BIRTH_LO}   RETURN
    Set Suite Variable    ${day_result}    ${day}
    Set Suite Variable    ${month_result}    ${month}
    Set Suite Variable    ${year_result}    ${year}

Input the Subjects
    [Arguments]    @{list_subjects}
    FOR    ${subject}    IN    @{list_subjects}
        Scroll Element Into View    ${SUBMIT_BUTTON}
        Click Element    ${SUBJECT_LO}
        Input Text    ${SUBJECT_LO}    ${subject}
        Press Keys    ${SUBJECT_LO}    RETURN
        Sleep    1s
        # Chọn suggestion đầu tiên sau khi gõ
    END
    Set Suite Variable    ${subject_result}    ${list_subjects}
  
    

Select the Hobbies
    [Arguments]    @{list_hobbies}
    FOR    ${hobby}    IN    @{list_hobbies}
        Click Element    xpath=//label[text()="${hobby}"]
    END
    Set Suite Variable    ${hobbies_result}    ${list_hobbies}



#Get Full Picture File Path
   # [Arguments]    ${FILE}
   # ${file_path}=    Normalize Path    ${CURDIR}/WAV-AUTO-HEM/${FILE}
   # RETURN    ${file_path}
 
#Upload Picture
   # [Arguments]    ${FILE}
   # Scroll Element Into View    ${CHOOSE_FILE}
   # ${file_path}    Get Full Picture File Path    ${FILE}
   # Choose File    ${CHOOSE_FILE}    ${file_path}
   # Set Suite Variable    ${file_result}    ${FILE}

Get Full Picture File Path
    [Arguments]    ${FILE}
    ${file_path}=    Normalize Path    ${FILE}
    RETURN    ${file_path}
 
Upload Picture
    [Arguments]    ${FILE}
    Scroll Element Into View    ${CHOOSE_FILE}
    ${file_path}    Get Full Picture File Path    ${FILE}
    Choose File    ${CHOOSE_FILE}    ${file_path}
    ${file_name}=    Evaluate    __import__('os').path.basename(r'''${file_path}''')
    Set Suite Variable    ${file_result}    ${file_name}

Input the Current Address 
    [Arguments]    ${CURRENT_ADDRESS_TEXT}
    Scroll Element Into View    ${CURRENT_ADDRESS}
    Input Text    ${CURRENT_ADDRESS}    ${CURRENT_ADDRESS_TEXT}
    Set Suite Variable    ${address_result}    ${CURRENT_ADDRESS_TEXT}


Select the state and city
    [Arguments]    ${state}   ${city}
    Scroll Element Into View    ${STATE_LO}
    Execute Javascript    document.getElementById("react-select-3-input").click();
    Input Text    ${STATE_LO}    ${state}
    Press Keys    ${STATE_LO}    RETURN
    Scroll Element Into View    ${CITY_LO}
    Execute Javascript    document.getElementById("react-select-4-input").click();
    Input Text    ${CITY_LO}    ${city}
    Press Keys    ${CITY_LO}    RETURN
    Set Suite Variable    ${state_result}    ${state}
    Set Suite Variable    ${city_result}    ${city}

    
Submit Practice Form 
    Scroll Element Into View    ${SUBMIT_BUTTON}
    Execute Javascript    document.getElementById("submit").click();



Table should contain inputed user name
    Table Should Contain    ${TABLE}    ${first_name_result}
    Table Should Contain    ${TABLE}    ${last_name_result}

Table should contain email user
    Table Should Contain    ${TABLE}    ${email_result}

Table should contain inputed gender
    Table Should Contain    ${TABLE}    ${gender_result}

Table should contain Mobile
    Table Should Contain    ${TABLE}    ${mobile_result}

Table should contain date of birth
    Table Should Contain    ${TABLE}    ${day_result}
    Table Should Contain    ${TABLE}    ${month_result}
    Table Should Contain    ${TABLE}    ${year_result}
    #Table Should Contain    ${TABLE}    ${date_of_birth_result}    
    
Table should contain subjects
    FOR    ${subject}    IN    @{subject_result}
        Table Should Contain    ${TABLE}    ${subject}
        Log    ${subject}
    END


Table should contain hobbies
    FOR    ${hobby}    IN    @{hobbies_result}
        Table Should Contain    ${TABLE}    ${hobby}
        Log    ${hobby}
    END

Table should contain picture
    Table Should Contain    ${TABLE}        ${file_result}

Table should contain Address
    Table Should Contain    ${TABLE}    ${address_result}

Table should contain state and city 
    Table Should Contain    ${TABLE}    ${state_result} ${city_result}



Verify submit successful 
    Table should contain inputed user name
    Table should contain inputed gender
    Table should contain email user
    Table should contain Mobile
    Table should contain date of birth
    Table should contain subjects
    Table should contain hobbies
    Table should contain picture
    Table should contain Address
    Table should contain state and city 

Verify that the required fields will be red-highlighted
    @{fields}=    Create List    firstName    lastName    userNumber    
    FOR    ${id}    IN    @{fields}
        ${border}=    Execute Javascript    return window.getComputedStyle(document.querySelector('#${id}')).getPropertyValue('border-color')
        Log    Border Color: ${border}
        Should Be Equal As Strings    ${border}    rgb(220, 53, 69)
        Sleep    0.5s
    END


Verify that the required radios will be red-highlighted
    @{gender_labels}=    Create List
    ...    "#genterWrapper > div.col-md-9.col-sm-12 > div:nth-child(1) > label"
    ...    "#genterWrapper > div.col-md-9.col-sm-12 > div:nth-child(2) > label"
    ...    "#genterWrapper > div.col-md-9.col-sm-12 > div:nth-child(3) > label"
    FOR    ${label_selector}    IN    @{gender_labels}
        ${color}=    Execute Javascript    return window.getComputedStyle(document.querySelector(${label_selector})).getPropertyValue("color")
        Log    Label color for ${label_selector}: ${color}
        Should Be Equal As Strings    ${color}    rgb(220, 53, 69)
    END