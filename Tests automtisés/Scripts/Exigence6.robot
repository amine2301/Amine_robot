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
${article}          Samsung


*** Test Cases ***
Recherche article disponible
    Ouvrir navigateur    ${vURL}    ${vBrowser}
    Recherche article disponible    ${article}
    Close Browser
