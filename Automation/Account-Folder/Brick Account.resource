*** Settings ***
Library     SeleniumLibrary
Library     Search_Brick_Account.py

*** Variables ***
# Create Brick Account XPath
${NEW_BUTTON_XPATH}     xpath=//a[@title="New"]
#${BRICK_RADIO_OPTION_XAPTH}     xpath=(//span[contains(@class,'slds-form-element__label')])[2]
${BRICK_RADIO_OPTION_XAPTH}     xpath=(//span[contains(@class,'slds-radio--faux')])[2]
${NEXT_BUTTON_XPATH}    xpath=//button[contains(.,'Next')]
${NEW_BRICK_NAME_XPATH}     xpath=//input[@name='Name']
${NEW_BRICK_NAME}   Test
${STATUS_DROPDOWN_XPATH}    xpath=//button[@aria-label='Status']
${STATUS_OPTION_XPATH}    xpath=//lightning-base-combobox-item[@role='option' and @data-value='Active']
${ACCOUNT_CHANNEL_DROPDOWN_XPATH}     xpath=//button[@aria-label='Channel']
${BRICK_CHANNEL_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@role='option' and @data-value='Brick']
${COUNTRY_DROPDOWN_XPATH}     xpath=//button[@aria-label='Country']
${COUNTRY_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@role='option' and @data-value='United States']
#${BRICK_COUNTRY_DROPDOWN_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Account.Country__c"]//button[@aria-label='Country']

# Search and Create Brick Account XPath
${APP_LAUNCHER_BUTTON}      xpath=//button[@title='App Launcher']
${SEARCH_APP}       xpath=//input[contains(@class,'slds-input') and contains(@placeholder,'Search apps and items')]
${ENTER_ACCOUNT_TEXT}     Accounts
${RESULT_ACCOUNT_TEXT}     xpath=//p[contains(.,'Accounts')]
${ACCOUNT_PAGE_HEADING}     xpath=//h1[@class='slds-var-p-right_x-small'][contains(.,'Accounts')]
${SEARCH_XPATH}    xpath=//input[@placeholder='Search this list...']
#${SEARCH_BRICK_NAME}       Test
${SEARCH_BRICK_NAME_XPath}    //a[@title='Test Brick']  # Replace with the actual locator of the "brick name" element


#   Edit Brick Account XPath
${EDIT_BRICK_BUTTON_XPATH}         xpath=//button[@name='Edit']
${EDIT_PAGE_HEADING}         Edit
${EDIT_ACCOUNT_NAME_XPATH}    xpath=//input[@name='Name']
${EDIT_BRICK_NAME}    Test Brick
${EDIT_BRICK_DESCRIPTION_XPATH}   xpath=//textarea[@class='slds-textarea']
${EDIT_BRICK_DESCRIPTION}       This is the test Brick description.
${SAVE_BUTTON_XPATH}     xpath=//button[@name='SaveEdit']

#   Delete Brick Account XPath
${DELETE_BRICK_BUTTON_XPATH}  xpath=//button[@class='slds-button slds-button_neutral' and @name='Delete']
${DELETE_CONFIRM_BUTTON_XPATH}  xpath=//button[@class='slds-button slds-button_neutral uiButton--default uiButton--brand uiButton forceActionButton' and @title='Delete']



*** Keywords ***
Create Brick
    Wait Until Element Is Visible   ${NEW_BUTTON_XPATH}     10s
    Click Element    ${NEW_BUTTON_XPATH}
    Wait Until Page Contains    New Account    10s
    Click Element   ${BRICK_RADIO_OPTION_XAPTH}
    Click Button    ${NEXT_BUTTON_XPATH}
    Wait Until Page Contains    New Account: Brick  15s

    # Fill the Brick Account detail
    Input Text    ${NEW_BRICK_NAME_XPATH}    ${NEW_BRICK_NAME}
#    Set Global Variable    ${BRICK_NAME}    ${NEW_BRICK_NAME}
    Click Button    ${STATUS_DROPDOWN_XPATH}
    Click Element    ${STATUS_OPTION_XPATH}
    Click Button    ${ACCOUNT_CHANNEL_DROPDOWN_XPATH}
    Click Element    ${BRICK_CHANNEL_OPTION_XPATH}
    Set Focus To Element     ${COUNTRY_DROPDOWN_XPATH}
    Click Button    ${COUNTRY_DROPDOWN_XPATH}
    Click Element   ${COUNTRY_OPTION_XPATH}
    Click Button    ${SAVE_BUTTON_XPATH}

Search and Create Brick Account
    Sleep    10s
    Click Button    ${APP_LAUNCHER_BUTTON}
#    Sleep    10s
    Wait Until Element Is Visible    ${SEARCH_APP}    10s
    Input Text   ${SEARCH_APP}    ${ENTER_ACCOUNT_TEXT}
#    Sleep    20s
    Wait Until Element Is Visible    ${RESULT_ACCOUNT_TEXT}    10s
    Click Element    ${RESULT_ACCOUNT_TEXT}
    Wait Until Element Is Visible   ${ACCOUNT_PAGE_HEADING}     10s
    Sleep    5s
    Input Text     ${SEARCH_XPATH}   ${NEW_BRICK_NAME}
    Press Key    ${SEARCH_XPATH}   \\13
    Sleep    10s
    ${brick_exists}=    Run Keyword And Return Status    Element Should Be Visible    xpath=${SEARCH_BRICK_NAME_XPath}
#
#
#    Run Keyword If    ${brick_exists}
#    ...    Click Element    ${SEARCH_BRICK_NAME_XPath}
#
#    ...    ELSE
#    ...    Create Brick
     Handle Brick Action    ${brick_exists}    ${SEARCH_BRICK_NAME_XPath}

Edit Brick Account
    Sleep    10s
    Wait Until Element Is Visible    ${EDIT_BRICK_BUTTON_XPATH}    10s
    Click Element    ${EDIT_BRICK_BUTTON_XPATH}
    Wait Until Page Contains    ${EDIT_PAGE_HEADING}   10s
    Sleep    5s
    Clear Element Text  ${EDIT_ACCOUNT_NAME_XPATH}   # Clears the existing text
    Input Text      ${EDIT_ACCOUNT_NAME_XPATH}   ${EDIT_BRICK_NAME}
#    Set Global Variable    ${BRICK_NAME}    ${EDIT_BRICK_NAME}
#    Click Element    xpath://textarea[@id='input-764']
    Input Text       ${EDIT_BRICK_DESCRIPTION_XPATH}   ${EDIT_BRICK_DESCRIPTION}
    Click Button    ${SAVE_BUTTON_XPATH}
#    Wait Until Keyword Succeeds  10s  1s  Alert Should Be Present

Delete Brick Account
    Sleep    10s
    Wait Until Element Is Visible    ${DELETE_BRICK_BUTTON_XPATH}     10s
    Sleep    5s
    Click Element    ${DELETE_BRICK_BUTTON_XPATH}
    Sleep    5s
    Wait Until Element Is Visible    ${DELETE_CONFIRM_BUTTON_XPATH}  10s
    Click Element    ${DELETE_CONFIRM_BUTTON_XPATH}
    Sleep    10s
