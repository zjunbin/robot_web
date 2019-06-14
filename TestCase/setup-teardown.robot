*** Settings ***
Library    SeleniumLibrary    
Resource    ../PageObjects/login_page.robot


*** Keywords ***
open browser
    SeleniumLibrary.Open Browser    http://120.78.128.25:8765/Index/login.html    googlechrome
    SeleniumLibrary.Maximize Browser Window

open and login
    SeleniumLibrary.Open Browser    http://120.78.128.25:8765/Index/login.html    googlechrome
    SeleniumLibrary.Maximize Browser Window
    login_page.login    18684720553    python
    

close browser
    SeleniumLibrary.Close Browser
 
refresh browser
    SeleniumLibrary.Execute Javascript    window.location.reload();
    
    
    

