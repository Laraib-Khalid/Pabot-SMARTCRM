*** Settings ***
Library     SeleniumLibrary
Resource    ../Login-Folder/Login.resource
Resource    ../Account-Folder/Brick Account.resource
Resource    ../Account-Folder/Hospital Account.resource
Suite Setup    Open Different Browser
*** Keywords ***
Open Different Browser
    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/  Chrome
    Maximize Browser Window

*** Test Cases ***
Testcase_1: Verify Login Functionality With Valid Credentials
    Valid Login



Testcase_2: Search and Create Brick Account
    Search and Create Brick Account

Testcase_3: Edit Brick Functionality
    Edit Brick Account

#Testcase_4: Delete Brick
#    Delete Brick Account
#
Testcase_5: Search and Create Hospital Account
    Search and Create Hospital Account

Testcase_6: Edit Hospital Account
       Edit Hospital Account

#Testcase_7: Delete Hospital Account
#   Delete Hospital Account
