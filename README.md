# Flutter e AWS Amplify Project

Este projeto é um aplicativo Flutter para a web, integrado com o AWS Amplify para backend e hospedagem. O aplicativo inclui funcionalidades como login, visualização de produtos, adição ao carrinho e finalização de compras.

## Sumário

1. [Visão Geral do Projeto](#visão-geral-do-projeto)
2. [Configuração do Ambiente](#configuração-do-ambiente)
3. [Configuração do Backend com AWS Amplify](#configuração-do-backend-com-aws-amplify)
4. [Comandos de Build e Deploy](#comandos-de-build-e-deploy)
5. [Estrutura do Projeto](#estrutura-do-projeto)
6. [Como Executar Localmente](#como-executar-localmente)

## Visão Geral do Projeto

Este projeto Flutter que inclui:

- **Tela de Login**: Permite que os usuários façam login no aplicativo.
- **Catálogo de Produtos**: Exibe uma lista de produtos disponíveis.
- **Detalhes do Produto**: Mostra informações detalhadas sobre um produto selecionado.
- **Carrinho de Compras**: Permite que os usuários adicionem produtos ao carrinho e visualizem os itens selecionados.
- **Finalização de Compra**: Permite que os usuários escolham a forma de pagamento e finalizem a compra.

## Configuração do Ambiente

### Requisitos

- **Flutter**: Versão estável mais recente. [Instale o Flutter](https://flutter.dev/docs/get-started/install).
- **Git**: Para controle de versão. [Instale o Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
- **AWS CLI**: Para interagir com os serviços AWS. [Instale o AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).

### Instalação

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio

2. Instale as dependências Flutter:

    ```bash
    flutter pub get

### Configuração do Backend com AWS Amplify

## Inicialização do Amplify

1. Instale o Amplify CLI:

    ```bash
    npm install -g @aws-amplify/cli

2. Configure o Amplify:

    ```bash
    amplify configure

3. Inicialize o Amplify no Projeto:

    ```bash
    amplify init

4. Adicione e Configure os Recursos:

    ```bash
    amplify add auth
    amplify add api
    amplify push

Isso criará os recursos necessários para autenticação e API.

### Comandos de Build e Deploy

## Build

1. Construa o Aplicativo Flutter para a Web:

    ```bash
    flutter build web

## Deploy
1. Adicione o Amplify ao Projeto:

Certifique-se de que o amplify.yml está configurado corretamente. Veja o exemplo de configuração abaixo.

2. Publique no AWS Amplify:

Siga as instruções no console AWS Amplify para configurar o deploy contínuo com seu repositório Git.

Exemplo de amplify.yml:

    ```bash
    version: 1
    backend:
    phases:
        build:
        commands:
            - '# Execute Amplify CLI with the helper script'
            - amplifyPush --simple
    frontend:
    phases:
        build:
        commands: []
    artifacts:
        baseDirectory: /build/web/
        files:
        - '**/*'
    cache:
        paths: []
    ```

### Estrutura do Projeto

    ```bash
    /lib
        /models
        /services
        /viewmodels
        /views
        /widgets
    /assets
    /build
    /amplify
        /backend
        /# Arquivos de configuração do Amplify
    /amplify.yml
    pubspec.yaml
    README.md
    ```

/lib: Contém o código-fonte do aplicativo, incluindo modelos, provedores, telas, serviços e widgets.

/assets: Contém arquivos de recursos como imagens e fontes.

/build: Contém os arquivos gerados pelo build do Flutter.

/amplify: Contém arquivos de configuração do Amplify.

### Como Executar Localmente

1. Certifique-se de que todos os requisitos estão instalados.

2. Clone o repositório e instale as dependências:

    ```bash
    git clone https://github.com/seu-usuario/seu-repositorio.git
    cd seu-repositorio
    flutter pub get

3. Execute o aplicativo localmente:
    ```bash
    flutter run -d chrome

