*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Case de Teste 01 - Acesso ao menu "Livros"
    [Documentation]        Esse teste faz a verificação no site da Amazon.com.br
    ...                    e verifica a categoria Livros
    [Tags]                 menus    categorias

    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Livros"
    Então o titulo da pagina deve ficar "Livros | Amazon.com.br"
    E o texto "Livros" deve ser exibido na pagina
    E categoria Lojas em destaque "Indicações" deve ser exibida na pagina


# Caso de Teste 02 - Pesquisa de um Produto
#     [Documentation]        Esse teste verificar a busca de um produto
#     [Tags]                 busca_produtos    lista_busca  
#     Dado que estou na home page da Amazon.com.br
#     Quando pesquisar pelo produto "Xbox Series S"
#     Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
#     E um produto da linha "Xbox Series S" deve ser mostrado na página  