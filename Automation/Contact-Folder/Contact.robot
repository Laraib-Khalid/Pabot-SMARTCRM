*** Settings ***
Library     SeleniumLibrary
Resource    ../Login-Folder/Login.resource
Resource    ../Contact-Folder/Medical Contact.resource
Resource    ../Contact-Folder/Contact Business Unit.resource
Suite Setup    Open Different Browser
*** Keywords ***
Open Different Browser
    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/  Chrome
    Maximize Browser Window

*** Test Cases ***
Testcase_1: Verify Login Functionality With Valid Credentials
    Valid Login
Testcase_8: Search and Create Medical Contact
    Search and Create Medical Contact

Testcase_9: Edit Medical Contact
    Edit Medical Contact

#Testcase_10: Delete Medical Contact
#    Delete Medical Contact
Testcase_17: Click on Contact Related Tab
    Click on Contact Related Tab

Testcase_18: Create Contact Business Unit
    Create Contact Business Unit

Testcase_19: Edit Contact Business Unit
    Edit Contact Business Unit

#Testcase_20: Delete Contact Business Unit
#    Delete Contact Business Unit
