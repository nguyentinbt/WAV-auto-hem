*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    XML
Library    Process
Resource    ../Tho_Pratice_Fill-Data/CommonKeywords.robot
Resource    ../Tho_Pratice_Fill-Data/CommonVariables.robot


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
    Upload Picture  ${CURDIR}/bai-du-thi-ke-chuyen-ve-me-viet-nam-anh-hung-600.jpg
    Input the Current Address    42 Tu Cuong
    Select the state and city    NCR    Delhi
    Submit Practice Form
    Verify submit successful


# Fill in the data into the Practice form except the required fields test 2
#     Open Browser    ${URL}    chrome
#     Maximize Browser Window
#     Input the Email
#     Select date of birth
#     Input the Subjects
#     Select the Hobbies
#     Select the Picture
#     Input the Current Address
#     Select the State and City
#     Submit Practice Form
#     Verify submit unsucessful