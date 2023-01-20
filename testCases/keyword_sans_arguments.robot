*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL}          https://admin-demo.nopcommerce.com/
${BROWSER}      chrome


*** Test Cases ***
login Test
    Lancer le navigateur
    Clear Element Text    id:Email
    Input Text    id:Email    admin@yourstore.com
    Input Password    id:Password    admin
    Click Button    xpath://button[@type="submit"]


*** Keywords ***
Lancer le navigateur
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
