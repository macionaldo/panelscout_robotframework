*** Settings ***

Library  SeleniumLibrary

Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://dareit.futbolkolektyw.pl/en/login?redirected=true
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//*[@id="__next"]/form/div/div[2]/button/span[1]
${LOGGINFIELD}      xpath=//*[@id='login']
${PASSWORDFIELD}        xpath=//*[@id='password']
${ADDPLAYER}        xpath=//*[@id="__next"]/div[1]/main/div[3]/div[2]/div/div/a/button/span[1]
${WRONGLOGIN}       xpath=//*[@id="__next"]/form/div/div[1]/div[3]/span
${CHANGELEANGUE}    xpath=*//*[@id="__next"]/form/div/div[2]/div/div
${POLISHLEANGUE}    xpath=//*[@id='menu-']/div[3]/ul/li[1]
${ZALOGUJ}      xpath=//*[contains(text(),'zaloguj')]
${ADDPLAYER}    xpath=//*[@id='__next']/div[1]/main/div[3]/div[2]/div/div/a/button
${ADDNAME}      xpath=//*[@id='__next']/div[1]/main/div[2]/form/div[2]/div/div[2]/div/div/input
${ADDSURNAME}   xpath=//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[3]/div/div/input
${ADDAGE}   xpath= //*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[7]/div/div/input
${ADDPOSITION}      xpath=//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[11]/div/div/input
${SUBMITPLAYER}     xpath=//*[@id="__next"]/div[1]/main/div[2]/form/div[3]/button[1]/span[1]

*** Test Cases ***

Login To The System
    Open login page
    Type in email
    Type in password
    Click on the Sumbit button
    Assert dashboard
    [Teardown]    Close Browser

Wrong Password
    Open login page
    Type in email
    Type in wrong password
    Click on the Sumbit button
    Assert wrong login
    [Teardown]    Close Browser

Wrong Login
    Open login page
    Type In Wrong email
    Type in password
    Click on the Sumbit button
    Assert wrong login
    [Teardown]    Close Browser

Leangue Change
    Open login page
    Click Leangue button
    Change To Polish
    Assert Polish
    [Teardown]    Close Browser

Add Player
    Open login page
    Type in email
    Type in password
    Click on the Sumbit button
    Assert dashboard
    Click on Add Player
    Assert Dashboard Player
    Add Name
    Add Surname
    Add Age
    Add Position
    Submit Player
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
Type in wrong email
    Input Text    ${LOGGINFIELD}    user07@getnada.comm
Type in password
    Input Text    ${PASSWORDFIELD}  Test-1234
Type in wrong password
    Input Text    ${PASSWORDFIELD}  Test-12345
Click on the Sumbit button
    Click Element    ${SIGNINBUTTON}
Assert dashboard
    Wait Until Element Is Visible   ${ADDPLAYER}
Assert wrong login
    Wait Until Element Is Visible    ${WRONGLOGIN}
Setup system under test

Click Leangue button
    Click Element  ${CHANGELEANGUE}
Change To Polish
    Click Element    ${POLISHLEANGUE}
Assert Polish
    Wait Until Element Is Visible    ${ZALOGUJ}
Click on Add Player
    Click Element    ${ADDPLAYER}
Add Name
    Input Text    ${ADDNAME}    Krzychu
Add Surname
    Input Text    ${ADDSURNAME}     Piącha
Add Age
    Input Text    ${ADDAGE}     12121995
Add Position
    Input Text    ${ADDPOSITION}    NAPASTNIK
Submit Player
    Click Element    ${SUBMITPLAYER}

Assert Dashboard Player
    Wait Until Element Is Visible    ${ADDNAME}



