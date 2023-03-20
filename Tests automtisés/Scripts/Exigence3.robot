*** Settings ***
Documentation       Fichiers de scripts pour le Tp Ecommerce.

Library             SeleniumLibrary
Library             DateTime
Library             String
Library             Dialogs
Library             OperatingSystem
Library             Collections
Resource            ../Ressources/Keywords/keywords.robot
Variables           ../Ressources/Locators/locators.py


*** Variables ***
${vURL}             http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}         chrome
${first_name}       Mohammed Amine
${last_name}        Babouche
${email}            b.m.a@gmail.com
${telephone}        4389901036
${password}         12345
${confirm}          12345
${newsletter}       1
${first_name1}      XXX
${last_name1}       YYY
${telephone1}       0000000000


*** Test Cases ***
S'inscrire avec un mail existant
    Ouvrir navigateur    ${vURL}    ${vBrowser}
    S'inscrire avec succes
    ...    ${first_name}
    ...    ${last_name}
    ...    ${email}
    ...    ${telephone}
    ...    ${password}
    ...    ${confirm}
    ...    ${newsletter}
    Logout
    S'inscrire avec echec
    ...    ${first_name1}
    ...    ${last_name1}
    ...    ${email}
    ...    ${telephone1}
    ...    ${password}
    ...    ${confirm}
    ...    ${newsletter}
    Close Browser
