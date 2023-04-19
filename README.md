# Docker PHP
Estrutura docker para rodar projetos em PHP com banco de dados Mysql e proxy reverso Nginx.


## Como utilizar
- Crie um arquivo `.env` na raiz do projeto utilizando o arquivo `.env_model` como modelo. Neste arquivo é necessário passar as credenciais de desejo do banco de dados. 
- Adicione seu projeto PHP dentro da pasta php/app. 
- Execute o comando `docker compose up -d` na raiz do projeto.
- Acesse app.localhost no seu navegador de preferência

### Como executar o meu projeto PHP dentro de `docker-php`?
- Copie a pasta do seu projeto para dentro de `projects/`.
- Adicione um novo arquivo dentro de `nginx/nome_projeto.conf`
- Cole esse trecho de código:
`nginx
server {
    listen 80;
    listen [::]:80;
    server_name nome_projeto.localhost;
    root /projects/nome_projeto;
    index index.php index.html;
    client_max_body_size 64M;
    
    location / {
        try_files $uri $uri/ /index.php;
        location = /index.php {
            fastcgi_pass    php:9000;
            include         fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_param PATH_INFO $fastcgi_path_info;
        }
    }

    location ~ \.php$ {
        return 444;
    }

}`
- Altere `nome_projeto` pelo nome da pasta do seu projeto
- Em seu navegador de preferência acesse `http://nome_projeto.localhost`

## Bibliotecas PHP inclusas
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
