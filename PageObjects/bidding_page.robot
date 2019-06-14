*** Settings ***
Library    String
Library    XML
Library    SeleniumLibrary    
Resource    ../PageLocator/Bidding_locator.robot

*** Keywords ***
select_bidding
    SeleniumLibrary.Wait Until Element Is Visible    ${bidding} 
    ${count}    SeleniumLibrary.Get Element Count    ${bidding}   
    ${ele}    SeleniumLibrary.Get WebElements    ${bidding}   
    ${number}    Evaluate    random.randint(0,${count}-1)    random
    SeleniumLibrary.Click Element    ${ele[${number}]}

bidding_success
    [Arguments]    ${amount}
    SeleniumLibrary.Wait Until Element Is Visible    ${invest}
    SeleniumLibrary.Input Text    ${invest}   ${amount}
    SeleniumLibrary.Click Button    ${bid_button}    
    
bidding_error
    [Arguments]    ${amount}
    SeleniumLibrary.Wait Until Element Is Visible    ${invest} 
    SeleniumLibrary.Input Text    ${invest}   ${amount}

get_error_bidding
    [Return]    ${result}
    SeleniumLibrary.Wait Until Element Is Visible    ${bid_button}
    ${result}    SeleniumLibrary.Get Text    ${bid_button}

get_except_bidding
    [Return]    ${result}
    SeleniumLibrary.Wait Until Element Is Visible    ${bid_button}
    ${result}    SeleniumLibrary.Get Text    ${bid_button}

check_relust
    [Arguments]    ${result}    ${excepted}
    BuiltIn.Should Be Equal    ${result}    ${excepted}
        
    
       
            