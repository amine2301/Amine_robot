*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${URL1}         https://admin-demo.nopcommerce.com/
${BROWSER1}     chrome
${URL2}         https://google.fr/
${BROWSER2}     chrome


*** Test Cases ***
login Test
    ${titre}=    Lancer le navigateur    ${URL1}    ${BROWSER1}
    Log To Console    ${titre} #afficher de la console le titre de la page
    Clear Element Text    id:Email
    Input Text    id:Email    admin@yourstore.com
    Input Password    id:Password    admin
    Click Button    xpath://button[@type="submit"]
    Close Browser

# search google
#    Lancer le navigateur    ${URL2}    ${BROWSER2}


*** Keywords ***
Lancer le navigateur
    [Arguments]    ${URL_SITE}    ${NAVIGATEUR}
    Open Browser    ${URL_SITE}    ${NAVIGATEUR}
    Maximize Browser Window
    ${titre_page}=    Get Title
    RETURN    ${titre_page} #retourner le titre de la page
