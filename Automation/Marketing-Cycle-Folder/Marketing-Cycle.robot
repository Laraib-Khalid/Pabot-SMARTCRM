*** Settings ***
Library     SeleniumLibrary
Resource    ../Login-Folder/Login.resource
Resource    ../Marketing-Cycle-Folder/Marketing Cycle.resource
Resource    ../Marketing-Cycle-Folder/Marketing Cycle Detail.resource
Resource    ../Marketing-Cycle-Folder/Target KPI.resource
Resource    ../Marketing-Cycle-Folder/TCL.resource
Suite Setup    Open Different Browser
*** Keywords ***
Open Different Browser
    Open Browser    https://raptorsconsulting--qasmartcrm.sandbox.lightning.force.com/  Chrome
    Maximize Browser Window

*** Test Cases ***
Testcase_1: Verify Login Functionality With Valid Credentials
    Valid Login


Testcase_21: Search and Create Marketing Cycle
    Search and Create Marketing Cycle

Testcase_22: Edit Marketing Cycle
    Edit Marketing Cycle

###Testcase_23: Delete Marketing Cycle
###    Delete Marketing Cycle

Testcase_24: Create Marketing Cycle Detail
    Create Marketing Cycle Detail

Testcase_25: Edit Marketing Cycle Detail
    Edit Marketing Cycle Detail

###Testcase_26: Delete Marketing Cycle Detail
###    Delete Marketing Cycle Detail

Testcase_27: Click on Marketing Cycle Related Tab
    Click on Marketing Cycle Related Tab

Testcase_28: Create Target KPI
    Create Target KPI

Testcase_29: Edit Target KPI
    Edit Target KPI

###Testcase_30: Delete Target KPI
###    Delete Target KPI
##

Testcase_31: Create Contact TCL
    Create Contact TCL

Testcase_32: Edit Contact TCL
    Edit Contact TCL