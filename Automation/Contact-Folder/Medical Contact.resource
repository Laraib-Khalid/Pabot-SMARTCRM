*** Settings ***
Library     SeleniumLibrary
Resource    ../Account-Folder/Brick Account.resource

*** Variables ***
# Create Medical Contact XPath
${NEW_MEDICAL_CONTACT_PAGE}     New Contact
#${MEDICAL_RADIO_OPTION_XPATH}     xpath=(//span[contains(@class,'slds-form-element__label')])[3]
${MEDICAL_RADIO_OPTION_XPATH}     xpath=(//span[contains(@class,'slds-radio--faux')])[3]
${MEDICAL_CONTACT_PAGE}     Contact
${SALUTATION_MEDICAL_DROPDOWN}     xpath=//button[@aria-label='Salutation']
${SALUTATION_MEDICAL_OPTION}    xpath=//span[@class='slds-media__body'][contains(.,'Ms.')]
${NEW_MEDICAL_FIRST_NAME_XPATH}     xpath=//input[@name='firstName']
${NEW_MEDICAL_FIRST_NAME}       Medical
${NEW_MEDICAL_LAST_NAME_XPATH}     xpath=//input[@name='lastName']
${NEW_MEDICAL_LAST_NAME}       Contact
${NEW_MEDICAL_EXTERNAL_ID_XPATH}    xpath=//input[@name='Contact_External_Id__c']
${NEW_MEDICAL_EXTERNAL_ID}      Medical_Contact
${CONTACT_PRIORITY_DROPDOWN_XPATH}    xpath=//button[@aria-label='Priority']
${CONTACT_PRIORITY_OPTION_XPATH}    xpath=//lightning-base-combobox-item[@role='option' and @data-value='B']
${CONTACT_SPECIALTY_DROPDOWN_XPATH}     xpath=//button[@aria-label='Specialty']
${CONTACT_SPECIALTY_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@role='option' and @data-value='Gastroenterology']
${NEW_MEDICAL_PERSON_TYPE_DROPDOWN_XPATH}     xpath=//button[@aria-label='Person Type']
${NEW_MEDICAL_PERSON_TYPE_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@role='option' and @data-value='Doctor']
${NEW_MEDICAL_ACCOUNT_DROPDOWN_XPATH}  xpath=//input[@placeholder='Search Accounts...']
${NEW_MEDICAL_ACCOUNT_DROPDOWN_OPTIONS_XPATH}     xpath=//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${NEW_MEDICAL_ACCOUNT_OPTION_XPATH}     xpath=(//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${CONTACT_ACCOUNT_NAME}     Test Hospital
${NEW_MEDICAL_COUNTRY_DROPDOWN_XPATH}     xpath=//div[@data-target-selection-name='sfdc:RecordField.Contact.Country__c']//button[@aria-label='Country']
${NEW_MEDICAL_COUNTRY_OPTION_XPATH}     xpath=//div[@data-target-selection-name='sfdc:RecordField.Contact.Country__c']//lightning-base-combobox-item[@role='option' and @data-value='United States']
${NEW_MEDICAL_GENDER_DROPDOWN_XPATH}     xpath=//button[@aria-label='Gender']
${NEW_MEDICAL_GENDER_OPTION_XPATH}     xpath=//lightning-base-combobox-item[@data-value='Female']
${NEW_MEDICAL_EMAIL_XPATH}  xpath=//input[@name='Email']
${NEW_MEDICAL_EMAIL}    medical@test.com
${NEW_MEDICAL_MOBILE_PHONE_XPATH}  xpath=//input[@name='MobilePhone']
${NEW_MEDICAL_MOBILE_PHONE}    1234567890
${NEW_MEDICAL_PHONE_XPATH}  xpath=//input[@name='Phone']
${NEW_MEDICAL_PHONE}    1234567890
${NEW_MEDICAL_SHIPPING_ADDRESS_DROPDOWN_XPATH}  xpath=(//input[normalize-space(@placeholder)='Search Address'])[1]
${NEW_MEDICAL_SHIPPING_ADDRESS_SEARCH_TEXT}   Soldotna, Alaska 99669, USA
${NEW_MEDICAL_SHIPPING_ADDRESS_SEARCH_RESULT}  xpath=//*[contains(@data-item-id,'combobox-input-')][3]
${NEW_MEDICAL_EMAIL_OPTIN_XPATH}  xpath=//input[@name='hasEmailOptIn__c']

# Search Contact XPath

${ENTER_CONTACT_TEXT}   Contacts
${RESULT_CONTACT_TEXT}     xpath=//p[contains(.,'Contacts')]
${CONTACT_PAGE_HEADING}     xpath=//h1[@class='slds-var-p-right_x-small'][contains(.,'Contacts')]
#${FILTER_CONTACT_XPATH}     xpath=(//div[contains(.,'Select a List View: Contacts')])[23]
#${SELECT_ALL_US_CONTACT_XPATH}     xpath=(//a[contains(.,'SelectedUS - All Contacts')])[1]
${FILTER_CONTACT_XPATH}     xpath=//button[@title='Select a List View: Contacts']
${SELECT_ALL_US_CONTACT_XPATH}     xpath=//span[@title='US - All Contacts']
${SEARCH_CONTACT_XPATH}    xpath=//input[@placeholder='Search this list...']
${SEARCH_CONTACT_NAME_XPath}    //a[@title='Medical Contact']  # Replace with the actual locator of the "medical contact name" element

#   Edit Medical Contact XPath
${EDIT_CONTACT_BUTTON_XPATH}      xpath=//li[@class='visible' and @data-target-selection-name='sfdc:StandardButton.Contact.Edit']//button[@name='Edit']
${EDIT_MEDICAL_EMAIL}    edit_medical@test.com
${EDIT_MEDICAL_MOBILE_PHONE}      9876543210
${EDIT_MEDICAL_PHONE}      9876543210

#   Delete Medical Contact XPath
${CONTACT_ACTION_DROPDOWN_BUTTON}  xpath=//*[@id="brandBand_2"]/div/div/div/div/div/one-record-home-flexipage2/forcegenerated-adg-rollup_component___force-generated__flexipage_-record-page___-medical_-contact_-record_-page___-contact___-v-i-e-w___-l-m-t___1738672678000/forcegenerated-flexipage_medical_contact_record_page_contact__view_js___lmt___1738672678000/record_flexipage-desktop-record-page-decorator/div[1]/records-record-layout-event-broker/slot/slot/flexipage-record-home-single-col-template-desktop2/div/div[1]/slot/flexipage-component2/slot/record_flexipage-dynamic-highlights2/div/record_flexipage-highlights-primary-row/div/runtime_platform_actions-actions-ribbon/ul/li[4]/lightning-button-menu/button
#${CONTACT_ACTION_DROPDOWN_BUTTON}  xpath=(//button[contains(.,'Show more actions')])[2]
${DELETE_CONTACT_BUTTON_XPATH}  xpath=//a[contains(.,'Delete')]
${CONTACTS_VISIBILITY_XPATH}    xpath=//h1[@class='slds-var-p-right_x-small'][contains(.,'Contacts')]

*** Keywords ***
Create Medical Contact
    Wait Until Element Is Visible   ${NEW_BUTTON_XPATH}     10s
    Click Element    ${NEW_BUTTON_XPATH}
    Wait Until Page Contains    ${NEW_MEDICAL_CONTACT_PAGE}    10s
    Click Element   ${MEDICAL_RADIO_OPTION_XPATH}
    Click Button    ${NEXT_BUTTON_XPATH}
    Sleep    10s
    Wait Until Page Contains    ${MEDICAL_CONTACT_PAGE}  10s

    # Fill the Medical Contact detail
    Click Element    ${SALUTATION_MEDICAL_DROPDOWN}
    Wait Until Element Is Visible    ${SALUTATION_MEDICAL_OPTION}   10s
    Click Element    ${SALUTATION_MEDICAL_OPTION}
    Input Text    ${NEW_MEDICAL_FIRST_NAME_XPATH}    ${NEW_MEDICAL_FIRST_NAME}
    Input Text    ${NEW_MEDICAL_LAST_NAME_XPATH}    ${NEW_MEDICAL_LAST_NAME}
    Input Text    ${NEW_MEDICAL_EXTERNAL_ID_XPATH}    ${NEW_MEDICAL_EXTERNAL_ID}
#    Set Global Variable    ${BRICK_NAME}    ${NEW_BRICK_NAME}
    Click Button    ${STATUS_DROPDOWN_XPATH}
    Click Element   ${STATUS_OPTION_XPATH}
    Click Button    ${CONTACT_PRIORITY_DROPDOWN_XPATH}
    Click Element   ${CONTACT_PRIORITY_OPTION_XPATH}
    Click Button    ${CONTACT_SPECIALTY_DROPDOWN_XPATH}
    Click Element   ${CONTACT_SPECIALTY_OPTION_XPATH}
    Mouse Down    ${NEW_MEDICAL_EMAIL_XPATH}
#    Scroll Element Into View    ${NEW_MEDICAL_EMAIL_XPATH}
    Click Element    ${NEW_MEDICAL_PERSON_TYPE_DROPDOWN_XPATH}
    Click Element   ${NEW_MEDICAL_PERSON_TYPE_OPTION_XPATH}
    Input Text    ${NEW_MEDICAL_ACCOUNT_DROPDOWN_XPATH}   ${CONTACT_ACCOUNT_NAME}
    Wait Until Element Is Visible    ${NEW_MEDICAL_ACCOUNT_DROPDOWN_OPTIONS_XPATH}    10s
    Click Element    ${NEW_MEDICAL_ACCOUNT_OPTION_XPATH}
    Click Button    ${NEW_MEDICAL_COUNTRY_DROPDOWN_XPATH}
    Click Element   ${NEW_MEDICAL_COUNTRY_OPTION_XPATH}
    Click Button    ${NEW_MEDICAL_GENDER_DROPDOWN_XPATH}
    Click Element   ${NEW_MEDICAL_GENDER_OPTION_XPATH}
    Input Text    ${NEW_MEDICAL_EMAIL_XPATH}     ${NEW_MEDICAL_EMAIL}
    Input Text    ${NEW_MEDICAL_MOBILE_PHONE_XPATH}    ${NEW_MEDICAL_MOBILE_PHONE}
    Input Text    ${NEW_MEDICAL_PHONE_XPATH}    ${NEW_MEDICAL_PHONE}
    Select Checkbox    ${NEW_MEDICAL_EMAIL_OPTIN_XPATH}
#    Checkbox Should Be Selected    ${NEW_MEDICAL_EMAIL_OPTIN_XPATH}
#    Scroll Element Into View    ${NEW_MEDICAL_SHIPPING_ADDRESS_DROPDOWN_XPATH}
#    Mouse Down     ${NEW_MEDICAL_SHIPPING_ADDRESS_DROPDOWN_XPATH}
    Input Text    ${NEW_MEDICAL_SHIPPING_ADDRESS_DROPDOWN_XPATH}    ${NEW_MEDICAL_SHIPPING_ADDRESS_SEARCH_TEXT}
    Sleep    10s
    Wait Until Element Is Visible    ${NEW_MEDICAL_SHIPPING_ADDRESS_SEARCH_RESULT}    10s
    Click Element    ${NEW_MEDICAL_SHIPPING_ADDRESS_SEARCH_RESULT}
    Sleep    10s
    Click Button    ${SAVE_BUTTON_XPATH}


Search and Create Medical Contact
    Sleep    10s
    Click Button    ${APP_LAUNCHER_BUTTON}
    Wait Until Element Is Visible    ${SEARCH_APP}    10s
    Input Text   ${SEARCH_APP}    ${ENTER_CONTACT_TEXT}
#    Sleep    10s
    Wait Until Element Is Visible    ${RESULT_CONTACT_TEXT}    10s
    Click Element    ${RESULT_CONTACT_TEXT}
    Wait Until Element Is Visible   ${CONTACT_PAGE_HEADING}     10s
    Sleep    5s
    Click Element   ${FILTER_CONTACT_XPATH}
    Wait Until Element Is Visible   ${SELECT_ALL_US_CONTACT_XPATH}     10s
    Click Element    ${SELECT_ALL_US_CONTACT_XPATH}
    Sleep    5s
    Input Text     ${SEARCH_XPATH}   ${NEW_MEDICAL_FIRST_NAME} ${NEW_MEDICAL_LAST_NAME}
    Press Key    ${SEARCH_XPATH}    \\13
    Sleep    5s
    ${contact_exists}=    Run Keyword And Return Status    Element Should Be Visible    xpath=${SEARCH_CONTACT_NAME_XPath}


    Run Keyword If    ${contact_exists}
    ...    Click Element    ${SEARCH_CONTACT_NAME_XPath}

    ...    ELSE
    ...    Create Medical Contact
#     Handle Brick Action    ${contact_exists}    ${SEARCH_CONTACT_NAME_XPath}

Edit Medical Contact
    Sleep    20s
    Wait Until Element Is Visible    ${EDIT_CONTACT_BUTTON_XPATH}    20s
    Click Element    ${EDIT_CONTACT_BUTTON_XPATH}
    Wait Until Page Contains    ${EDIT_PAGE_HEADING}   10s
    Sleep    10s
    Input Text    ${NEW_MEDICAL_EMAIL_XPATH}     ${EDIT_MEDICAL_EMAIL}
    Input Text    ${NEW_MEDICAL_MOBILE_PHONE_XPATH}    ${EDIT_MEDICAL_MOBILE_PHONE}
    Input Text    ${NEW_MEDICAL_PHONE_XPATH}    ${EDIT_MEDICAL_PHONE}
    Click Button  ${SAVE_BUTTON_XPATH}
#    Wait Until Keyword Succeeds  10s  1s  Alert Should Be Present

Delete Medical Contact
    Sleep    20s
    Wait Until Element Is Visible    ${CONTACT_ACTION_DROPDOWN_BUTTON}     30s
    Click Element     ${CONTACT_ACTION_DROPDOWN_BUTTON}
    Click Element   ${DELETE_CONTACT_BUTTON_XPATH}
    Wait Until Element Is Visible    ${DELETE_CONFIRM_BUTTON_XPATH}  10s
    Click Element    ${DELETE_CONFIRM_BUTTON_XPATH}
    Sleep    20s
    Wait Until Element Is Visible    ${CONTACTS_VISIBILITY_XPATH}    10s
