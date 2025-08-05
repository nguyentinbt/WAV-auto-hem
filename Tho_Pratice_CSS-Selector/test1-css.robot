*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    XML
Library    Process
Resource    ../Tho_Pratice_CSS-Selector/CommonKeywords-css.robot
Resource    ../Tho_Pratice_CSS-Selector/CommonVariables-css.robot
*** Variables ***
${file_path}    ${CURDIR}/bai-du-thi-ke-chuyen-ve-me-viet-nam-anh-hung-600.jpg

*** Test Cases ***    
Verify that the user can fill in data and submit successfully with valid data
    Open the Demoqa page
    Input the Name    NGUYEN    THO
    Input the Email    tho.nguyen@gmail.com
    Choose the Gender    Female
    Input the Mobile    0123456789
    Select date of birth    26    March    1998
    Input the Subjects    Maths    English
    Select the Hobbies    Sports    Music
    Upload Picture  ${file_path}
    Input the Current Address    42 Tu Cuong
    Select the state and city    NCR    Delhi
    Submit Practice Form
    Verify submit successful
