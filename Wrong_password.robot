*** Settings ***

Library  SeleniumLibrary

Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en/login?redirected=true
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//*[@id="__next"]/form/div/div[2]/button/span[1]
${LOGGINFIELD}      xpath=//*[@id='login']
${PASSWORDFIELD}        xpath=//*[@id='password']
${CHECK}        xpath=//*[@id="__next"]/form/div/div[1]/div[3]/span



*** Test Cases ***

LoginToTheSystem
    Open login page
    Type in email
    Type in password
    Assert dashboard
    [Teardown]    Close Browser

#Test title
#    [Tags]    DEBUG
#    Procided precondition
#    When action
#    Then check expectations

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
Type in email
    Input Text    ${LOGGINFIELD}    user07@getnada.com
Type in password
    Input Text    ${PASSWORDFIELD}  Test-12345

Assert dashboard
    Wait Until Element Is Visible   ${CHECK}
Setup system under test




