*** Settings ***
Resource            ../configurations/configs.resource

*** Variables ***
${FORM_TITLE}    Thanks for submitting the form
${FIRST_NAME}    Tu
${LAST_NAME}    Ha
${GENDER}    Female
${EMAIL}    minhtu11598@gmail.com
${MOBILE}    0909090909
${DATE_OF_BIRTH}    10 June,2025
${SUBJECT}    English
${HOBBIES}    Music
${PICTURE}    picture.jpg
${CURRENT_ADDRESS}    abcxyz
${STATE_CITY}    Haryana Karnal

*** Test Cases ***
Verify showing confirmation popup with provided data
    [Documentation]    This function is for submitting the Practice
    Open Practice Form
    Input Name    ${FIRST_NAME}    ${LAST_NAME}
    Input Email    ${EMAIL}
    Select Gender
    Input Mobile    ${MOBILE}
    Scroll To The End Of The Page
    Input Subject    ${SUBJECT}
    Select Hobbies
    Select Picture
    Input Address    ${CURRENT_ADDRESS}
    Select State
    Select City
    Select Date
    Submit Practice Form
    Verify the submited form
        ...    ${FORM_TITLE}
        ...    ${FIRST_NAME}
        ...    ${LAST_NAME}
        ...    ${EMAIL}
        ...    ${GENDER}    
        ...    ${MOBILE} 
        ...    ${DATE_OF_BIRTH}
        ...    ${SUBJECT}
        ...    ${HOBBIES}
        ...    ${PICTURE}
        ...    ${CURRENT_ADDRESS}
        ...    ${STATE_CITY} 
    Sleep    5s  
    



