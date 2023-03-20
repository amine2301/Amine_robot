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


*** Test Cases ***
S'inscrire avec un abonnement a la newsletter
    Ouvrir navigateur    ${vURL}    ${vBrowser}
    S'inscrire avec succes
    ...    ${first_name}
    ...    ${last_name}
    ...    ${email}
    ...    ${telephone}
    ...    ${password}
    ...    ${confirm}
    ...    ${newsletter}
    Close Browser
