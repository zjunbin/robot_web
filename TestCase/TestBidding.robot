*** Settings ***
Library    SeleniumLibrary    
Resource    ../PageObjects/bidding_page.robot
Resource    ../PageLocator/Bidding_locator.robot
Resource    setup-teardown.robot
Variables    ../TestData/bidding_data.py

Test Setup    setup-teardown.open and login
Test Teardown    setup-teardown.close browser

*** Test Cases ***
bidding_success
    bidding_page.select_bidding
    BuiltIn.Log    ${error_data[0]["invest"]}    
    bidding_page.bidding_success    ${error_data[0]["invest"]}
    ${result}    bidding_page.get_error_bidding
    bidding_page.check_relust    ${result}    ${error_data[0]["excepted"]}


bidding_error
    bidding_page.select_bidding
    BuiltIn.Log    ${error_data[0]["invest"]}    
    bidding_page.bidding_error    ${error_data[0]["invest"]}
    ${result}    bidding_page.get_error_bidding
    bidding_page.check_relust    ${result}    ${error_data[0]["excepted"]}
    
    