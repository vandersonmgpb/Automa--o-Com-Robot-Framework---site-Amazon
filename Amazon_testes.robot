*** Settings ***
Documentation        Essa suíte testa o site da Amazon.com.br
Resource             amazon_resources.robot
Test Setup           Abrir o navegador
Test Teardown        Fechar o navegador
*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Pesquisar produto"
    [Documentation]    Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...                e verificar a categoria Computadores e Informática
    [Tags]             menus    categorias
    Acessar a home page do site Amazon.com.br
    Verificar se o titulo da pagina fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
    Verificar se o titulo da pagina fica "Livros | Amazon.com.br" 
    Verificar se aparece a categoria "Indicações" 

Caso de Teste 02 - Pesquisa de produto
    [Documentation]    Esse teste verificar a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome do produto "Console Playstation 5" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Playstation 5"



