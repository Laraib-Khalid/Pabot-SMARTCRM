*** Settings ***
Library     SeleniumLibrary
Resource    Medical Contact.resource
Resource    ../Business-Unit-Folder/Business Unit.resource

*** Variables ***
#${CONTACT_RELATED_TAB}  xpath=(//a[@id='flexipage_tab__item' and @data-label='Related'])[2]
${CONTACT_RELATED_TAB}  xpath=//a[@id='flexipage_tab__item' and @data-label='Related']
${CONTACT_BUSINESS_UNIT_NEW_BUTTON}  xpath=(//button[contains(.,'New')])[1]
${NEW_CONTACT_BUSINESS_UNIT_PAGE}  New Contact Business Unit
${CONTACT_BUSINESS_UNIT_COUNTRY_DROWNDOWN_XPATH}  xpath=//div[@data-target-selection-name="sfdc:RecordField.Contact_Business_Unit__c.Country__c"]//button[@aria-label='Country']
${CONTACT_BUSINESS_UNIT_COUNTRY_OPTION_XPATH}  xpath=//div[@data-target-selection-name="sfdc:RecordField.Contact_Business_Unit__c.Country__c"]//lightning-base-combobox-item[@role='option' and @data-value='United States']
#${SEARCH_BUSINESS_UNIT_DROWNDOWN_XPATH}  xpath=(//input[contains(@id,'combobox-input-')])[2]
${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_XPATH}  xpath=//div[@data-target-selection-name="sfdc:RecordField.Contact_Business_Unit__c.Business_Unit__c"]//input[contains(@placeholder,'Business Unit')]
#${SEARCH_CONTACT_BUSINESS_UNIT_TEXT}  US-ENT & Surgery
${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}     xpath=//div[@data-target-selection-name="sfdc:RecordField.Contact_Business_Unit__c.Business_Unit__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option']
${SEARCH_CONTACT_BUSINESS_UNIT_OPTION_XPATH}      xpath=(//div[@data-target-selection-name="sfdc:RecordField.Contact_Business_Unit__c.Business_Unit__c"]//lightning-base-combobox-item[@class='slds-media slds-listbox__option slds-media_center slds-listbox__option_entity' and @role='option'])[2]
${EDIT_PRORITY_OPTION_CONTACT_BUSINESS_UNIT_XPATH}   xpath=//lightning-base-combobox-item[@role='option' and @data-value='C']
#${EDIT_ACTION_CONTACT_BUSINESS_UNIT_XPATH}   xpath=(//button[.//span[@class='slds-assistive-text' and text()='Show Actions']])[2]
${EDIT_ACTION_CONTACT_BUSINESS_UNIT_XPATH}   xpath=(//table[@aria-label="Contact Business Unit"]//button[@class="slds-button slds-button_icon-border slds-button_icon-x-small"])[1]
${DELETE_ACTION_CONTACT_BUSINESS_UNIT_XPATH}   xpath=//a[@class='slds-button slds-button--icon-x-small slds-button--icon-border-filled' and @title='Show 2 more actions']
${EDIT_CONTACT_RELATED_XPATH}    xpath=//a[@title='Edit']
${DELETE_CONTACT_RELATED_XPATH}   xpath=//a[@title='Delete']


*** Keywords ***
Click on Contact Related Tab
    Sleep    10s
    Search and Create Medical Contact
    Sleep    10s
    Wait Until Element Is Visible    ${CONTACT_RELATED_TAB}    10s
    Click Element    ${CONTACT_RELATED_TAB}


Create Contact Business Unit
#    Mouse Down    xpath=//span[@title='Contact Business Unit']/ancestor::div[1]/ancestor::div[1]/ancestor::div[1]//following-sibling::div[2]
#    Execute Javascript    Window.scrollTo(0, document.body.scrollHeight);
#    Execute Javascript    arguments[0].scrollIntoView();
    Sleep    10s
    Execute JavaScript    window.scrollBy(0, 200);
    Wait Until Element Is Visible    ${CONTACT_BUSINESS_UNIT_NEW_BUTTON}    10s
    Click Element    ${CONTACT_BUSINESS_UNIT_NEW_BUTTON}
    Wait Until Page Contains    ${NEW_CONTACT_BUSINESS_UNIT_PAGE}   10s
    Click Button    ${CONTACT_BUSINESS_UNIT_COUNTRY_DROWNDOWN_XPATH}
    Click Element   ${CONTACT_BUSINESS_UNIT_COUNTRY_OPTION_XPATH}
    Click Button    ${CONTACT_SPECIALTY_DROPDOWN_XPATH}
    Click Element   ${CONTACT_SPECIALTY_OPTION_XPATH}
    Click Button    ${CONTACT_PRIORITY_DROPDOWN_XPATH}
    Click Element   ${CONTACT_PRIORITY_OPTION_XPATH}
    Input Text   ${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_XPATH}     ${BU_NAME}
    Sleep    5s
    Wait Until Element Is Visible   ${SEARCH_CONTACT_BUSINESS_UNIT_DROWNDOWN_OPTIONS_XPATH}  10s
    Click Element   ${SEARCH_CONTACT_BUSINESS_UNIT_OPTION_XPATH}
    Click Button    ${SAVE_BUTTON_XPATH}


Edit Contact Business Unit
    Sleep    10s
#    Execute JavaScript    window.scrollBy(0, 160);
    Wait Until Element Is Visible     ${EDIT_ACTION_CONTACT_BUSINESS_UNIT_XPATH}   10s
    Click Element     ${EDIT_ACTION_CONTACT_BUSINESS_UNIT_XPATH}
    Wait Until Element Is Visible    ${EDIT_CONTACT_RELATED_XPATH}   10s
    Click Element    ${EDIT_CONTACT_RELATED_XPATH}
    Wait Until Element Is Visible    ${CONTACT_PRIORITY_DROPDOWN_XPATH}     10s
    Click Button    ${CONTACT_PRIORITY_DROPDOWN_XPATH}
    Click Element  ${EDIT_PRORITY_OPTION_CONTACT_BUSINESS_UNIT_XPATH} 
    Wait Until Element Is Visible    ${SAVE_BUTTON_XPATH}
    Click Button    ${SAVE_BUTTON_XPATH}
    
Delete Contact Business Unit
    Sleep    10s
    Wait Until Element Is Visible     ${DELETE_ACTION_CONTACT_BUSINESS_UNIT_XPATH}   10s
    Click Element     ${DELETE_ACTION_CONTACT_BUSINESS_UNIT_XPATH}
    Wait Until Element Is Visible    ${DELETE_CONTACT_RELATED_XPATH}   10s
    Click Element    ${DELETE_CONTACT_RELATED_XPATH}
    Wait Until Element Is Visible    ${DELETE_CONFIRM_BUTTON_XPATH}  10s
    Click Element    ${DELETE_CONFIRM_BUTTON_XPATH}