*** Settings ***
Library    SeleniumLibrary
Resource    ../tu_tests/tu_test1.robot

*** Variables ***
${FIRST_NAME}    //*[@id="firstName"]
${LAST_NAME}    //*[@id="lastName"]
${EMAIL}    //*[@id="userEmail"]
${FEMALE_GENDER}    //label[contains(text(), 'Female')]
${MOBILE}    //*[@id="userNumber"]
${DATE_OF_BIRTH}    //*[@id="dateOfBirthInput"]
${SUBJECT}    //*[@id="subjectsContainer"]
${HOBBIES}    //label[contains(text(), 'Music')]
${UPLOAD_PICTURE}    //*[@id="uploadPicture"]
${CURRENT_ADDRESS}    //*[@id="currentAddress"]
${SELECT_STATE}    //*[@id="state"]
${SELECT_CITY}    //*[@id="city"]
${SUBMIT_BUTTON}    //*[@id="submit"]
