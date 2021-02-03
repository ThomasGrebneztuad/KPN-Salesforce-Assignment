*** Settings ***
Documentation     KPN Assessment Test
Library           String
Library           SeleniumLibrary    timeout=15
Library           ScreenCapLibrary

*** Variables ***
${BROWSER}        chrome
${SLEEP}          5
${url}            https://login.salesforce.com
${Username}       taniya.dey-1452066749@vlocityapps.com
${Password}       Vlocity1234
${accountURL}     https://knowledge-web-14204.lightning.force.com/lightning/r/Account/0014x000009sUZOAA2/view
${contractTermMonths}    12
${contractStatus}    Draft
${BROWSER}        chrome
${SELSPEED}       0.0s
${errorMessageContract}    Choose a valid contract status and save your changes. Ask your admin for details.
${errorPopupText}    Error : Please fix all the fields with errors.

*** Test Cases ***
KPN Test 1
    [Tags]    1
    Open Browser    ${accountURL}    ${BROWSER}
    Maximize Browser Window
    ${STRING}    Generate Random String    8
    Input Text    //input[@name="username"]    ${Username}
    Input Password    //input[@name="pw"]    ${Password}
    Click Element    //input[@name="Login"]
    Wait Until Element Is Visible    //a[@title="Accounts"]
    Wait Until Element Is Visible    xpath=(//a[contains(@href, 'javascript:void(0);')])[3]
    ${accountName}    Get Text    xpath=//HEADER[@id="oneHeader"]/DIV[3]/DIV[1]/DIV[2]/DIV[1]/DIV[@role="tablist"][1]/UL[@role="presentation"][2]/LI[@role="presentation"][1]/A[@role="tab"][1]/SPAN[2]
    Wait Until Keyword Succeeds    10 sec    0.5 sec    Select Frame    id:iFrameResizer0
    Wait Until Element Is Enabled    xpath=(//a[contains(@href, 'javascript:void(0);')])[3]
    Set Focus To Element    xpath=(//a[contains(@href, 'javascript:void(0);')])[3]
    Press Keys    xpath=(//a[contains(@href, 'javascript:void(0);')])[3]    ENTER
    Unselect Frame
    Wait Until Keyword Succeeds    16 sec    0.5 sec    Select Frame    id:iFrameResizer2
    Wait Until Element Is Visible    xpath=//section[@id='CreateNew']/section/div/div/div/h1
    Page Should Contain Element    xpath=//section[@id='CreateNew']/section/div/div/div/h1
    Wait Until Element Is Visible    //input[@id="ContractName"]
    Current Frame Should Contain    Create New Contract
    Input Text    //input[@id="ContractName"]    ${STRING}
    Wait Until Element Is Visible    xpath=//ng-form[@id='Status|0']
    Click Element    xpath=//ng-form[@id='Status|0']
    Select From List By Value    //select[@name="loopname"]    12
    Click Element    xpath=//div[@id="CreateNew_nextBtn"]
    Wait Until Element Is Visible    xpath=//li[5]/div/div/div/span
    Wait Until Element Is Visible    xpath=//li[2]/div/div/div/span
    Take Screenshot    name=screenshotContract    format=jpg    quality=100
    ${accountNameTest}    Get Text    xpath=//a[contains(@href, '/lightning/r/0014x000009sUZOAA2/view')]
    Should be true    "${accountName}" == "${accountNameTest}"
    ${contractTermMonthsTest}    Get Text    xpath=//li[5]/div/div/div/span
    ${contractStatusTest}    Get Text    xpath=//li[2]/div/div/div/span
    ${contractNumber}    Get Text    xpath=//h1/div[2]/span
    Log To Console    ${contractNumber}
    Should be true    "${contractTermMonthsTest}" == "${contractTermMonths}"
    Should be true    "${contractStatusTest}" == "${contractStatus}"
    Unselect Frame
    [Teardown]    Close Browser

KPN Test 2
    [Tags]    2
    Open Browser    ${accountURL}    ${BROWSER}
    Maximize Browser Window
    ${STRING}    Generate Random String    8
    Input Text    //input[@name="username"]    ${Username}
    Input Password    //input[@name="pw"]    ${Password}
    Click Element    //input[@name="Login"]
    Wait Until Element Is Visible    //a[@title="Accounts"]
    Wait Until Element Is Visible    xpath=(//a[contains(@href, 'javascript:void(0);')])[3]
    ${accountName}    Get Text    xpath=//HEADER[@id="oneHeader"]/DIV[3]/DIV[1]/DIV[2]/DIV[1]/DIV[@role="tablist"][1]/UL[@role="presentation"][2]/LI[@role="presentation"][1]/A[@role="tab"][1]/SPAN[2]
    Wait Until Keyword Succeeds    10 sec    0.5 sec    Select Frame    id:iFrameResizer0
    Wait Until Element Is Enabled    xpath=(//a[contains(@href, 'javascript:void(0);')])[3]
    Set Focus To Element    xpath=(//a[contains(@href, 'javascript:void(0);')])[3]
    Press Keys    xpath=(//a[contains(@href, 'javascript:void(0);')])[3]    ENTER
    Unselect Frame
    Wait Until Keyword Succeeds    16 sec    0.5 sec    Select Frame    id:iFrameResizer2
    Wait Until Element Is Visible    xpath=//section[@id='CreateNew']/section/div/div/div/h1
    Page Should Contain Element    xpath=//section[@id='CreateNew']/section/div/div/div/h1
    Wait Until Element Is Visible    //input[@id="ContractName"]
    Current Frame Should Contain    Create New Contract
    Input Text    //input[@id="ContractName"]    ${STRING}
    Wait Until Element Is Visible    xpath=//ng-form[@id='Status|0']
    Click Element    xpath=//ng-form[@id='Status|0']/div/div/label[2]/span
    Select From List By Value    //select[@name="loopname"]    24
    Click Element    xpath=//div[@id="CreateNew_nextBtn"]
    Wait Until Element Is Visible    xpath=//div[@id='alert-container']/div[3]/button
    ${errorPopupTextTest}    Get Text    xpath=//div[@id='alert-container']/div[2]
    Should be true    "${errorPopupTextTest}" == "${errorPopupText}"
    Click Element    //button[@id="alert-ok-button"]
    Wait Until Element Is Not Visible    xpath=//div[@id='alert-container']/div[3]/button
    ${errorMessageContractTest}    Get Text    xpath=//ng-form[@id='Status|0']/div/div[2]/div/small
    Should be true    "${errorMessageContractTest}" == "${errorMessageContract}"
    Take Screenshot    name=screenshotErrorMessage    format=jpg    quality=100
    [Teardown]    Close Browser

*** Keywords ***
