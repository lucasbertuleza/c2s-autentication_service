# Authentication Service
<sup>Repositório parte do teste técnico da C2S.</sup>

Este serviço é um back-end (API Rails + banco de dados MySQL) representado na cor cinza. A API implementa endpoints para registro, login e validação de token dos usuários da [webapp](https://github.com/lucasbertuleza/c2s-main_app).

![c4_container](https://github.com/user-attachments/assets/de1c731c-49d9-4a8a-b7d8-83533e09d18f)

## Dependências

- Docker
- Docker Compose

**Observação 1:** Talvez você encontre alguma dificuldade para fazer o build da aplicação caso esteja executando o Linux no Windows com o WSL. \
**Observação 2:** Se você utiliza o compose como plugin, utilize `docker-compose` ao invés de `docker compose` ao executar os comandos.

## Build

Caso você tenha o utilitário `make` instalado, basta executar o seguinte comando na raiz do projeto:

```sh
make build
```

Caso contrário:

```sh
cp .env.example .env
docker compose build
```

## Executando a aplicação

⚠️ **Atenção!** \
Este serviço faz parte de um conjunto de 4 serviços e é uma das dependências do [gerenciador de tarefas](https://github.com/lucasbertuleza/c2s-main_app), portanto, é necessário que ele esteja em execução junto com os demais para que o gerenciador de tarefas possa funcionar corretamente.

```bash
make up
# ou
docker compose up -d
```

Verifique o status (**Up**) de todos os containers para garantir que não houve qualquer problema:

```bash
docker compose ps -a --format "table {{.Name}}\t{{.Status}}"
```

# Endpoints

- `POST /v1/users` - Registra novos usuários
- `POST /v1/tokens` - Retorna um JWT + dados do usuário caso seja enviada uma credencial (e-mail e senha) válida, caso contrário retorna o status `401`
- `POST /v1/authorization` - Valida o token enviado no Header "Authorization" da requisição e, casa seja válido, retorna o ID do usuário associado. Caso contrário, retorna `403`
