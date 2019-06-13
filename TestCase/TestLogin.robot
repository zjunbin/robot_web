*** Settings ***
Resource    ../PageObjects/index.robot
Resource    ../PageObjects/login_page.robot
Resource    setup-teardown.robot
Library    SeleniumLibrary    
Variables    ../TestData/login_data.py

#每个用例执行 = python的setup
Test Setup    setup-teardown.open browser
Test Teardown    setup-teardown.close browser

#所有用例执行 = python的 setupclasss
#Suite Setup    

#强制标签
#Force Tags    python14    demo
#默认标签
Default Tags    14

*** Test Cases ***

用例1-登录成功
    [Tags]    smoke
    login_page.login    ${success_data.user}    ${success_data.password}
    index.check

用例2-登录失败-账号为空
    login_page.login    ${EMPTY}    ${null_data[0]["password"]}
    ${result}=    login_page.tabel-message
    login_page.check-result    ${result}    ${null_data[0]["excepted"]}
 
用例3-登录失败-密码为空
    login_page.login    ${null_data[1]["user"]}    ${EMPTY}
    ${result}=    login_page.tabel-message
    login_page.check-result    ${result}    ${null_data[1]["excepted"]}
        
用例4-登录失败-密码错误
    login_page.login    ${exception_data[0]["user"]}    ${exception_data[0]["password"]}
    ${result}=    login_page.alter-message
    login_page.check-result    ${result}    ${exception_data[0]["excepted"]}
    
用例5-登录失败-未授权账号
    login_page.login    ${exception_data[1]["user"]}    ${exception_data[1]["password"]}
    ${result}=    login_page.alter-message
    login_page.check-result    ${result}    ${exception_data[1]["excepted"]}




        