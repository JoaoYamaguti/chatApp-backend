# chatApp-backend

Inicialmente este projeto é um teste para a [vaga de Dev Jr.](https://github.com/rhuantac/vaga-dev-voll) da empresa [Voll](https://vollsolutions.com.br/).

O projeto basicamente consiste em um chat para troca de mensagens entre os usuários.

#### Diferenciais (Extras Opcionais)

- [ ] Comunicação em tempo real via WebSocket (uso opcional de ActionCable ou outra tecnologia).
- [x] Suporte ao envio de arquivos (permitindo anexos como imagens e documentos pequenos).
- [x] Implementação de paginação na listagem de mensagens para melhor desempenho.
- [x] Mecanismo de autenticação (por exemplo, JWT) para garantir segurança nas requisições.
- [x] Criação de um endpoint de métricas (/metrics) com estatísticas sobre mensagens enviadas e usuários ativos.
- [ ] Processamento assíncrono de mensagens utilizando fila de tarefas (exemplo: Redis + Sidekiq).

## Tecmologias Usadas
- Ruby on Rails API: Framwork para construir a RestAPI.
- ActiveRecords: ORM utilizada pelo Rails.
- JWT: Ferramenta de autenticação web.
- SQLite: Banco de dados relacional.

## Project Setup

```sh
bundle install
```

### Set Invironment Variable 

Crie o arquivo .env para configurar as seguintes variaveis ambiente:

```
CORS_ORIGINS = *the frontend  base url, example: "http://localhost:5173"*
```

### Compile and Hot-Reload for Development

```sh
rails server
```
