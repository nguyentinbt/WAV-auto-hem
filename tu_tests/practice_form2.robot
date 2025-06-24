*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../tu_resource/practice_form.resource


*** Test Cases ***
Check Red Highlight Fields
    Open Browser    https://demoqa.com/automation-practice-form    Chrome
    Maximize Browser Window
    Scroll To The End Of The Page
    Submit Practice Form
    Verify that the required fields will be red-highlighted
    Verify that the required radios will be red-highlighted
