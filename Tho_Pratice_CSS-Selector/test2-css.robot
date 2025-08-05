*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    XML
Library    Process
Resource    ../Tho_Pratice_CSS-Selector/CommonKeywords-css.robot
Resource    ../Tho_Pratice_CSS-Selector/CommonVariables-css.robot

*** Test Cases ***
Verify that the required fields will show red color when the user submits without inputting this information
    Open the Demoqa page
    Submit Form
    Verify that the required fields will be red-highlighted
    Verify that the required radios will be red-highlighted