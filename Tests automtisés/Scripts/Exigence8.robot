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
${vURL}                 http://tutorialsninja.com/demo/index.php?route=common/home
${vBrowser}             chrome
${first_name}           Mohammed Amine
${last_name}            Babouche
${email}                b.m.a4@gmail.com
${telephone}            4389901036
${password}             12345
${confirm}              12345
${newsletter}           1
${article}              iPod Nano
${qte}                  2
${address}              2020 Sherbrooke est
${city}                 Montréal
${postcode}             A0A 0A0
${payment_details}      Visa card


*** Test Cases ***
Passer une commande
# test n'est pas complet a cause d'un bug dans le site
    Ouvrir navigateur    ${vURL}    ${vBrowser}
    Recherche article disponible    ${article}
    Ajouter article au panier    ${article}
    S'inscrire avec succes
    ...    ${first_name}
    ...    ${last_name}
    ...    ${email}
    ...    ${telephone}
    ...    ${password}
    ...    ${confirm}
    ...    ${newsletter}
    Passer la commande
    ...    ${qte}
    ...    ${first_name}
    ...    ${last_name}
    ...    ${address}
    ...    ${city}
    ...    ${postcode}
    ...    ${payment_details}
    Close Browser
