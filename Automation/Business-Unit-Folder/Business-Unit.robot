*** Settings ***
Library     SeleniumLibrary
Resource    ../Login-Folder/Login.resource
Resource    ../Business-Unit-Folder/Business Unit.resource
Resource    ../Business-Unit-Folder/User Business Unit.resource
Suite Setup    Open Different Browser
*** Keywords ***
Open Different Browser
    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/  Chrome
    Maximize Browser Window

*** Test Cases ***
Testcase_1: Verify Login Functionality With Valid Credentials
    Valid Login
Testcase_11: Search and Create Business Unit
    Search and Create Business Unit

Testcase_12: Edit Business Unit
    Edit Business Unit

#Testcase_13: Delete Business Unit
#    Delete Business Unit

Testcase_14: Create User Business Unit
    Create User Business Unit

#Testcase_15: Edit User Business Unit
#    Edit User Business Unit
#
#Testcase_16: Delete User Business Unit
#    Delete User Business Unit
