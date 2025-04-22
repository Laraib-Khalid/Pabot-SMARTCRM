*** Settings ***
Library     SeleniumLibrary

*** Variables ***
# Login Folder XPath
${USERNAME_XPATH}    //*[@id="username"]
${VALID_USERNAME_VALUE}    admin.qasmartcrm@bssuniversal.com
${INVALID_USERNAME_VALUE}    admin
${PASSWORD_XPATH}    //*[@id="password"]
${PASSWORD_VALUE}    Bss@2025
${LOGIN_BUTTON_XPATH}    //*[@id="Login"]

${CRM_TEXT_VISIBLE}     xpath=/html/body/div[4]/div[1]/section/div[1]/div[1]/one-appnav/div/div/div/h1

*** Keywords ***
Valid Login
    Input Text    ${USERNAME_XPATH}    ${VALID_USERNAME_VALUE}
    Input Password    ${PASSWORD_XPATH}    ${PASSWORD_VALUE}
    Click Button    ${LOGIN_BUTTON_XPATH}
    Wait Until Element Is Visible    ${CRM_TEXT_VISIBLE}     10s

InValid Login
    Input Text    ${USERNAME_XPATH}    ${INVALID_USERNAME_VALUE}
    Input Password    ${PASSWORD_XPATH}    ${PASSWORD_VALUE}
    Click Button    ${LOGIN_BUTTON_XPATH}
    Sleep    10s
#    Wait Until Element Is Visible    ${CRM_TEXT_VISIBLE}     10s
