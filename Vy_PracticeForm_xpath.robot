*** Settings ***
Library           SeleniumLibrary
Resource    Vy_PracticeForm_xpath.resource

*** Variables ***
${FIRSTNAME}    Vy
${LASTNAME}    Phan
${EMAIL}    ocgaotinhnghich@gmail.com
${GENDER}    Female
${MOBILE}    0973693145
${SUBJECTS}    English   
@{HOBBY}        Sports  Reading    
${ADDRESS}  42 Tu Cuong, Ward 4, Tan Binh District
${STATE}    NCR
${CITY}    Delhi
${PICTURE}    15.jpg 
${DOB}    	27 October,1997
${STAGE_CITY}    NCR Delhi
${SUBMIT_TITLE}    Thanks for submitting the form 

 

*** Test Cases ***
Open Web Browser and input valid data to submit
    Open Chrome Browser
    Maximize Browser Window
    Input Firstname    ${FIRSTNAME}
    Input Lastname    ${LASTNAME}
    Input Email    ${EMAIL}
    Select Gender    ${GENDER}
    Input Mobile Number    ${MOBILE}
    Set Date Of Birth    27    9    1997
    Input Subjects    ${SUBJECTS}
    Select Hobbies    @{HOBBY} 
    Upload Picture    ${PICTURE}
    Input Address    ${ADDRESS}
    Select State And City    ${STATE}    ${CITY}
    Click on Submit button
    Verify the submit form full fill    ${SUBMIT_TITLE}    ${ADDRESS}    ${STAGE_CITY}    ${FIRSTNAME}    ${LASTNAME}    ${EMAIL}    ${GENDER}    ${MOBILE}    ${DOB}    ${SUBJECTS}    @{HOBBY}
    Sleep    5s
    Close Window

Open Web Browser and leave the require fields as blank to submit
    Open Chrome Browser
    Maximize Browser Window
    Click on Submit button
    Sleep    5s
    Verify the required fields will show in red
    Verify the required radios will show in red


    


    