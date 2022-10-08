*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}                         chrome
${URL}                             https://www.amazon.com.br/
${MENU_LIVROS}                     //*[@id="nav-xshop"]/a[7]
${HEADER_LIVROS}                   //h1[contains(.,'Loja de Livros')]

       
*** Keywords ***

Abrir o navegador
    Open Browser        browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot   locator
    Close Browser

Acessar a home page do site Amazon.com.br
    Go to     url=${URL}
    Wait Until Element Is Visible     locator=${MENU_LIVROS}

 Entrar no menu "Livros"
    Click Element    locator=${MENU_LIVROS}

Verificar se aparece a frase "${FRASE}" 
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible     locator=${HEADER_LIVROS}

Verificar se o titulo da pagina fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    //img[contains(@alt,'Indicações de Livros')]

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}
    
Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

O sistema o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[@class='a-size-base a-color-base a-text-normal'][contains(.,'${PRODUTO}')])[1]


# #            GHERKIN STEPS            # #

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o titulo da pagina fica "Amazon.com.br | Tudo pra você, de A a Z."


Quando acessar o menu "Livros"
     Entrar no menu "Livros"

Então o titulo da pagina deve ficar "Livros | Amazon.com.br"
    Verificar se aparece a frase "Loja de Livros"

E o texto "Livros" deve ser exibido na pagina
    Verificar se aparece a frase "Loja de Livros"

E categoria Lojas em destaque "Indicações" deve ser exibida na pagina
    Verificar se aparece a categoria "Lojas em destaque"