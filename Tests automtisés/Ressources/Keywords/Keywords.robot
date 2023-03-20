*** Settings ***
Library         SeleniumLibrary
Library         DateTime
Library         String
Library         XML
Library         Collections
Variables       ../Locators/locators.py


*** Keywords ***
Ouvrir navigateur
    [Arguments]    ${vURL}    ${vBrowser}
    Open Browser    ${vURL}    ${vBrowser}
    Maximize Browser Window

Logout
    Wait Until Element Is Visible    ${span_my_account}
    Click Element    ${span_my_account}
    Click Element    ${a_logout}

S'inscrire avec succes
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${telephone}    ${password}    ${confirm}    ${newsletter}
    Wait Until Element Is Visible    ${span_my_account}
    Click Element    ${span_my_account}
    Click Element    ${a_register}
    Wait Until Element Is Visible    ${input_first_name}
    Input Text    ${input_first_name}    ${first_name}
    Input Text    ${input_last_name}    ${last_name}
    Input Text    ${input_email}    ${email}
    Input Text    ${input_telephone}    ${telephone}
    Input Password    ${input_password}    ${password}
    Input Password    ${input_confirm}    ${confirm}
    Select Radio Button    newsletter    ${newsletter}
    Select Checkbox    ${input_checkbox}
    Click Element    ${input_continue}
    Run Keyword And Ignore Error    Wait Until Page Contains    Your Account Has Been Created!

S'inscrire avec echec
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${telephone}    ${password}    ${confirm}    ${newsletter}
    Wait Until Element Is Visible    ${span_my_account}
    Click Element    ${span_my_account}
    Click Element    ${a_register}
    Wait Until Element Is Visible    ${input_first_name}
    Input Text    ${input_first_name}    ${first_name}
    Input Text    ${input_last_name}    ${last_name}
    Input Text    ${input_email}    ${email}
    Input Text    ${input_telephone}    ${telephone}
    Input Password    ${input_password}    ${password}
    Input Password    ${input_confirm}    ${confirm}
    Select Radio Button    newsletter    ${newsletter}
    Select Checkbox    ${input_checkbox}
    Click Element    ${input_continue}
    Wait Until Page Contains    Warning: E-Mail Address is already registered!

Login
    [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible    ${span_my_account}
    Click Element    ${span_my_account}
    Click Element    ${a_login}
    Input Text    ${input_email}    ${email}
    Input Password    ${input_password}    ${password}
    Click Element    ${input_submit}
    Page Should Contain    Your Store

Mot de passe oublié
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${span_my_account}
    Click Element    ${span_my_account}
    Click Element    ${a_login}
    Click Element    ${a_forgotten_pasword}
    Input Text    ${input_forgotten_password}    ${email}
    Click Element    ${input_submit}
    Page Should Contain    An email with a confirmation link has been sent your email address.

Recherche article disponible
    [Arguments]    ${article}
    Wait Until Element Is Visible    ${input_search}
    Input Text    ${input_search}    ${article}
    Click Button    ${span_button}
    Page Should Not Contain    There is no product that matches the search criteria.

Recherche article non-disponible
    [Arguments]    ${article}
    Wait Until Element Is Visible    ${input_search}
    Input Text    ${input_search}    ${article}
    Click Button    ${span_button}
    Page Should Contain    There is no product that matches the search criteria.
    Sleep    1

Ajouter article au panier
    [Arguments]    ${article}
    Click Element    ${a_add_to_cart1}${article}${a_add_to_cart2}
    Sleep    1

Passer la commande
    [Arguments]    ${qte}    ${fname}    ${lname}    ${address}    ${city}    ${postcode}    ${payment_details}
    Wait Until Element Is Visible    ${span_cart}
    Click Element    ${span_cart}
    Wait Until Element Is Visible    ${input_qte}
    Clear Element Text    ${input_qte}
    Input Text    ${input_qte}    ${qte}
    Click Element    ${button_update}
    Click Element    ${a_checkout}
    Reload Page
    Sleep    1
    Wait Until Element Is Visible    ${input_firstname}
    Wait Until Page Contains Element    ${input_firstname}
    Input Text    ${input_firstname}    ${fname}
    Input Text    ${input_lastname}    ${lname}
    Input Text    ${input_address}    ${address}
    Input Text    ${input_city}    ${city}
    Input Text    ${input_postcode}    ${postcode}
    Click Element    ${select_country}
    Click Element    ${option_canada}
    Click Element    ${select_zone}
    Click Element    ${option_quebec}
    Click Element    ${input_confirm1}
    Wait Until Element Is Visible    ${text_area}
    Input Text    ${text_area}    ${payment_details}
    Select Checkbox    ${input_checkbox}
    Click Element    ${input_confirm2}
