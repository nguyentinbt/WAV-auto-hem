*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Get CSS Selector On contact Us Form
    Open Browser    https://webdriveruniversity.com/Contact-Us/contactus.html    chrome
    Input Text    css:#contact_form > input:nth-child(1)    Tu
    Input Text    css:#contact_form > input:nth-child(2)    Ha
    Input Text    css:#contact_form > input:nth-child(3)    test@gmail.com
    Input Text    css:#contact_form > textarea    hello
    Click Button    css:[value="SUBMIT"]

Get CSS Selector On Login Form
    Open Browser    https://webdriveruniversity.com/Login-Portal/index.html    chrome
    Input Text    css:#text    Tu Ha
    Input Text    css:#password    123
    Click Button    css:#login-button

Get CSS Selector On To-Do List
    Open Browser    https://webdriveruniversity.com/To-Do-List/index.html    chrome
    Input Text    css:#container > input[type=text]    Eat Breakfast
    Click Element    css:#container > ul > li:nth-child(1)
    Click Element    css:#container > ul > li:nth-child(2)
    Click Element    css:#container > ul > li:nth-child(3)

Get CSS Selector On Page Object Model
    Open Browser    https://webdriveruniversity.com/Page-Object-Model/index.html    chrome
    Click Element    css:#button-find-out-more > b
    Sleep    2s
    Click Button    css:#myModal > div > div > div.modal-footer > button:nth-child(1)

Get CSS Selector On Click Once
    Open Browser    https://webdriveruniversity.com/Accordion/index.html    chrome
    Click Button    css:#manual-testing-accordion
    Click Button    css:#cucumber-accordion
    Click Button    css:#automation-accordion
    Click Button    css:#click-accordion

Get CSS Selector On Dropdown And Radio Button
    Open Browser    https://webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    chrome
    # Dropdown
    Click Element    css:#dropdowm-menu-1
    Click Element    css:[value="python"]
    # Radio button
    Click Element    css:[value="blue"]
    # Selected and Disabled
    Element Should Be Enabled    css:[value="lettuce"]
    Click Element    css:[value="lettuce"]
    Click Element    css:#fruit-selects
    Click Element    css:[value="pear"]
    Element Should Be Disabled    css:[value="cabbage"]
    Sleep    2s

Get CSS Selector On Checkboxes
    Open Browser    https://webdriveruniversity.com/Dropdown-Checkboxes-RadioButtons/index.html    chrome
    
    @{checkboxes}=    Get WebElements    css=input[type="checkbox"]

    FOR    ${checkbox}    IN    @{checkboxes}
        Click Element    ${checkbox}
    END

Get CSS Selector On Ajax Loader
    Open Browser    https://webdriveruniversity.com/Ajax-Loader/index.html    chrome
    Sleep    7s
    Click Element    css:#button1
    Sleep    2s
    Click Button    css:#myModalClick > div > div > div.modal-footer > button
    
Get CSS Selector On Actions Page
    Open Browser    https://webdriveruniversity.com/Actions/index.html#    chrome
    Maximize Browser Window
    # Drag and Drop
    Drag And Drop    css:#draggable    css:#droppable
    Element Should Contain     css:#droppable    Dropped!
    # Hold and Release
    Mouse Down    css:#click-box
    Mouse Up    css:#click-box
    # Double click
    Double Click Element    css:#double-click
    Mouse Over    css:#div-hover > div.dropdown.hover > button
    Click Element    css:#div-hover > div.dropdown.hover > div > a

Get CSS Selector On Alert Popup 
    Open Browser    https://webdriveruniversity.com/Popup-Alerts/index.html    chrome
    Click Element    css:#button1
    Sleep    1s
    Handle Alert    action=ACCEPT
    Click Element    css:#button2
    Sleep    1s
    Click Button    css:#myModal > div > div > div.modal-footer > button
    Click Element    css:#button4
    Sleep    1s
    Handle Alert    action=DISMISS
    Element Should Contain    css:#confirm-alert-text    You pressed Cancel!
    Click Element    css:#button3
    Sleep    7s
    Click Element    css:#button1
    Sleep    2s
    Click Button    css:#myModalClick > div > div > div.modal-footer > button