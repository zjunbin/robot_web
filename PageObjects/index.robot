*** Settings ***
Library    SeleniumLibrary    

*** Keywords ***
check
    SeleniumLibrary.Wait Until Element Is Visible    //a[contains(text(),'小蜜蜂')]    20 
    SeleniumLibrary.Page Should Contain Element    //a[contains(text(),'小蜜蜂')]
        
    