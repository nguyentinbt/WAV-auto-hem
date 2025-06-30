*** Variables ***
${URL}    https://demoqa.com/automation-practice-form
${FIRST_NAME_LO}    xpath=//input[@id='firstName']
${LAST_NAME_LO}    xpath=//input[@id='lastName']
${EMAIL_LO}    xpath=//input[@id='userEmail']
${MOBILE_LO}    xpath=//input[@id='userNumber']
${SUBJECT_LO}    xpath=//input[@id='subjectsInput']
${CHOOSE_YOUR_BIRTH_LO}    xpath=//input[@id='dateOfBirthInput']
#{FILE}    ${CURDIR}/picture/bai-du-thi-ke-chuyen-ve-me-viet-nam-anh-hung-600.jpg
${CHOOSE_FILE}    xpath=//input[@id='uploadPicture']
${CURRENT_ADDRESS}   xpath=//textarea[@id='currentAddress'] 
${STATE_LO}    xpath=//input[@id='react-select-3-input']
${CITY_LO}    xpath=//input[@id='react-select-4-input']
${SUBMIT_BUTTON}    xpath=//button[@class='btn btn-primary']
${SUBMIT_SUCCESSFUL_LABEL}    xpath=//div[@class='modal-title h4']
${TABLE}    xpath=//table[@class='table table-dark table-striped table-bordered table-hover']
#${first_name_result} 
#${last_name_result}
${email_result}    
${gender_result} 
${mobile_result}
${day_result}
${month_result}
${year_result}
${subject_result}
${hobbies_result}
${address_result}
${state_result}
${city_result}
#${date_of_birth_result}