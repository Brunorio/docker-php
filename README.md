# Docker PHP
Estrutura docker para rodar projetos em PHP com banco de dados Mysql e proxy reverso Nginx.


## Como utilizar
- Crie um arquivo `.env` na raiz do projeto utilizando o arquivo `.env_model` como modelo. Neste arquivo é necessário passar as credenciais de desejo do banco de dados. 
- Adicione seu projeto PHP dentro da pasta php/app. 
- Execute o comando `docker compose up -d` na raiz do projeto.
- Acesse app.localhost no seu navegador de preferência

### Bibliotecas PHP inclusas
- libzip
- libpng
- jpeg
- freetype
- postgresql
- zip
- intl
- gb
- pdo
- pdo_mysql
- pdo_pgsql
- mysqli
- pgsql
- composer

### Remover containers
Caso deseja remover todos os containers e imagens, em ambiente Linux execute `sh clear-docker.sh`.