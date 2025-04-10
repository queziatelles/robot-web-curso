*** Settings ***

Library  SeleniumLibrary

*** Variables ***
${SITE_URL}                    https://automationpratice.com.br/
${SITE_URL_QUEZIA}             https://google.com/
${USUARIO_EMAIL}               teste@gmail.com
${USUARIO_SENHA}               123456

*** Keywords ***
Abrir Site Quezia
        Open Browser  ${SITE_URL_QUEZIA}    chrome

Acessar Site da qazando
         Open Browser  ${SITE_URL}    chrome
         Esperar Elemento  1
               
Abrir esse site
        [Arguments]     ${url}
         Open Browser  ${url}    chrome

Clicar no botao login
        Click Element  xpath://a[@href='/login']
        Esperar Elemento  10

Digitar email
        Input Text      id:user        ${USUARIO_EMAIL}

Digitar senha
        Input Text      id:password     ${USUARIO_SENHA}

Clicar no botao entrar
        Click Element   id:btnLogin

Verificar texto Login Realizado
        ${texto_atual}   Get Text      id:swal2-title
        Should Be Equal As Strings    ${texto_atual}  Login realizado  

Tirar Print
        Capture Page Screenshot

Esperar Elemento
        [Arguments]      ${tempo}
        Set Selenium Implicit Wait  ${tempo}s        

*** Test Cases ***
Cenário 1: Acessando o site da QAZANDO
        [Tags]  Teste4
        Acessar Site da qazando
        Clicar no botao login
        Digitar email
        Digitar senha
        Clicar no botao entrar
        Verificar texto Login Realizado



        

        
