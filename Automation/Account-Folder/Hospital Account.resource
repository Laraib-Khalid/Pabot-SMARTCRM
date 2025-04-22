*** Settings ***
Library     SeleniumLibrary
Resource    Brick Account.resource

*** Variables ***
# Account details
${ACCOUNT_BRICK_NAME}       Test Brick

# Create Hospital XPath values
${NEW_BUTTON_XPATH}         xpath=//a[@title="New"]
${NEXT_BUTTON_XPATH}    xpath=//button[contains(.,'Next')]
${NEW_HOSPITAL_ACCOUNT_NAME_XPATH}    xpath=//input[@name='Name']
${NEW_HOSPITAL_ACCOUNT_NAME}   Test Hospital
${NEW_HOSPITAL_ACCOUNT_CHANNEL_OPTION_XPATH}  xpath=//lightning-base-combobox-item[@role='option' and @data-value='Hospital']
${ACCOUNT_BRICK_DROPDOWN_XPATH}  xpath=(//input[contains(@role,'combobox')])[2]
${ACCOUNT_BRICK_DROPDOWN_OPTIONS_XPATH}     xpath=//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${ACCOUNT_BRICK_OPTION_XPATH}    xpath=(//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${ACCOUNT_BILLING_DROPDOWN_XPATH}  xpath=(//input[normalize-space(@placeholder)='Search Address'])[1]
${ACCOUNT_BILLING_SEARCH_TEXT}   Soldotna, Alaska 99669, USA
${ACCOUNT_BILLING_SEARCH_RESULT}  xpath=//*[contains(@data-item-id,'combobox-input-')][3]

#   Hospital Account XPath
${ACCOUNT_TAB_XPATH}     xpath=//a[@title='Accounts']
${SEARCH_HOSPITAL_NAME}       Test Hosp
${HOSPITAL_NAME_ID}    xpath=//a[@title='Test Hospital']

${EDIT_HOSPITAL_NAME}    Test Hospital
${EDIT_HOSPITAL_BUTTON_XPATH}         xpath=(//button[@name='Edit'])[2]

${DELETE_HOSPITAL_BUTTON_XPATH}  xpath=(//button[@name='Delete'])[2]
${ACCOUNTS_VISIBILITY_XPATH}  xpath=//h1[@class='slds-var-p-right_x-small'][contains(.,'Accounts')]
*** Keywords ***
Create Hospital
    # Navigate and create a new hospital account
    Wait Until Element Is Visible    ${NEW_BUTTON_XPATH}    10s
    Click Element    ${NEW_BUTTON_XPATH}
    Wait Until Page Contains    New Account    10s
    Click Button    ${NEXT_BUTTON_XPATH}
    Wait Until Page Contains    New Account: Clinic/Hospital  15s

    # Fill the Brick Account details
    Input Text        ${NEW_HOSPITAL_ACCOUNT_NAME_XPATH}    ${NEW_HOSPITAL_ACCOUNT_NAME}
    Click Button    ${STATUS_DROPDOWN_XPATH}
    Click Element    ${STATUS_OPTION_XPATH}
    Click Button    ${ACCOUNT_CHANNEL_DROPDOWN_XPATH}
    Click Element    ${NEW_HOSPITAL_ACCOUNT_CHANNEL_OPTION_XPATH}
    Click Button    ${COUNTRY_DROPDOWN_XPATH}
    Click Element    ${COUNTRY_OPTION_XPATH}
    Scroll Element Into View    ${ACCOUNT_BRICK_DROPDOWN_XPATH}
    Input Text    ${ACCOUNT_BRICK_DROPDOWN_XPATH}   ${ACCOUNT_BRICK_NAME}
    Wait Until Element Is Visible    ${ACCOUNT_BRICK_DROPDOWN_OPTIONS_XPATH}    10s
    Click Element    ${ACCOUNT_BRICK_OPTION_XPATH}
    Sleep    5s
    Scroll Element Into View    ${ACCOUNT_BILLING_DROPDOWN_XPATH}
#    Click Element    xpath=//input[normalize-space(@placeholder)='Search Address']
    Input Text    ${ACCOUNT_BILLING_DROPDOWN_XPATH}    ${ACCOUNT_BILLING_SEARCH_TEXT}
    Sleep    10s
    Wait Until Element Is Visible    ${ACCOUNT_BILLING_SEARCH_RESULT}   10s
#    Sleep    50s
    Click Element    ${ACCOUNT_BILLING_SEARCH_RESULT}
    Sleep    10s
    Click Button    ${SAVE_BUTTON_XPATH}
Search and Create Hospital Account
    Sleep    10s
    Click Button    ${APP_LAUNCHER_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_APP}    10s
    Input Text   ${SEARCH_APP}    ${ENTER_ACCOUNT_TEXT}
#    Sleep    20s
    Wait Until Element Is Visible    ${RESULT_ACCOUNT_TEXT}   10s
    Click Element    ${RESULT_ACCOUNT_TEXT}
    Wait Until Element Is Visible   ${ACCOUNT_PAGE_HEADING}     10s
    Sleep    5s
#    Clear Element Text  ${SEARCH_ACCOUNT_XPATH}
    Input Text   ${SEARCH_XPATH}    ${SEARCH_HOSPITAL_NAME}
    Sleep    10s
    Press Key    ${SEARCH_XPATH}    \\13
    Sleep    10s
    ${hospital_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${HOSPITAL_NAME_ID}
    Run Keyword If    ${hospital_exists}
    ...    Click Element    ${HOSPITAL_NAME_ID}

    ...    ELSE
    ...    Create Hospital

Edit Hospital Account
    Sleep    10s
    Wait Until Element Is Visible    ${EDIT_HOSPITAL_BUTTON_XPATH}   20s
#    Page Should Contain Button    xpath=//button[@type="button" and @name='Edit']
    Click Element    ${EDIT_HOSPITAL_BUTTON_XPATH}
    Wait Until Page Contains    ${EDIT_PAGE_HEADING}   10s
    Sleep    10s
    Clear Element Text  ${EDIT_ACCOUNT_NAME_XPATH}  # Clears the existing text
    Input Text  ${EDIT_ACCOUNT_NAME_XPATH}  ${EDIT_HOSPITAL_NAME}
    Click Button    ${SAVE_BUTTON_XPATH}
#    Wait Until Keyword Succeeds  10s  1s  Alert Should Be Present

Delete Hospital Account
    Sleep    10s
    Wait Until Element Is Visible     ${DELETE_HOSPITAL_BUTTON_XPATH}    30s
#    Page Should Contain Button    xpath=//button[@type="button" and @name='Delete']
    Click Element    ${DELETE_HOSPITAL_BUTTON_XPATH}
    Wait Until Element Is Visible    ${DELETE_CONFIRM_BUTTON_XPATH}  10s
    Click Element    ${DELETE_CONFIRM_BUTTON_XPATH}
    Sleep    10s
    Wait Until Element Is Visible    ${ACCOUNTS_VISIBILITY_XPATH}     10s
