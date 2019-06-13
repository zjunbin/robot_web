*** Settings ***
Library    SeleniumLibrary
Resource    ../PageLocator/login_locator.robot

*** Keywords ***
login
    [Arguments]    ${username}   ${password}
    SeleniumLibrary.Wait Until Element Is Visible    ${name}    20
    SeleniumLibrary.Input Text    ${name}    ${username}
    SeleniumLibrary.Input Text    ${pwd}    ${password}
    SeleniumLibrary.Click Button    ${button}
    
    
tabel-message
    SeleniumLibrary.Wait Until Page Contains Element    ${message-table}    20
    ${text}=    SeleniumLibrary.Get Text    ${message-table}
    [Return]    ${text}

alter-message
    SeleniumLibrary.Wait Until Element Is Visible    ${message-alter}    20
    ${text}=    SeleniumLibrary.Get Text    ${message-alter}    
    [Return]    ${text}
    
check-result
    [Arguments]    ${Actual}    ${excepted}
    BuiltIn.Should Be Equal    ${Actual}    ${excepted}

