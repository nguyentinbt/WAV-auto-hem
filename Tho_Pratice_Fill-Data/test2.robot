*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    XML
Library    Process
Resource    ../Tho_Pratice_Fill-Data/CommonKeywords.robot
Resource    ../Tho_Pratice_Fill-Data/CommonVariables.robot

*** Test Cases ***
Verify that the required fields will show red color when the user submits without inputting this information
    Open the Demoqa page
    Submit Form
    Sleep    0.5s
    Verify that the required fields will be red-highlighted
    Verify that the required radios will be red-highlighted