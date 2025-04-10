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
         MAXIMIZE Browser WINDOW

Abrir esse site
        [Arguments]     ${url}
         Open Browser  ${url}    chrome

Aguardar site carregar
        Sleep  3s    

Clicar no botao login
        Click Element  xpath://a[@href='/login']

Digitar email
        Input Text      id:user        ${USUARIO_EMAIL}

Digitar senha
        Input Text      id:password     ${USUARIO_SENHA}

Clicar no botao entrar
        Click Element   id:btnLogin

Verificar texto Login realizado
        ${texto_atual}  Get Text   id:swal2-title
        Should Be Equal As Strings     ${texto_atual}      Login realizado  

Tirar Print
        Capture Page Screenshot
        
*** Test Cases ***
Cenário 1: Acessando o site da QAZANDO
        [Tags]  Teste1
        Acessar Site da qazando
        Aguardar site carregar
        Clicar no botao login
        Aguardar site carregar
        Digitar email
        Digitar senha
        Aguardar site carregar
        Clicar no botao entrar
        Aguardar site carregar
        Verificar texto Login realizado
        
