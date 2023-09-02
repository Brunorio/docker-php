# Docker PHP

Esta é uma estrutura Docker projetada para executar projetos em PHP (7.3 ou 8.2), com suporte para banco de dados MySQL e um servidor proxy reverso Nginx.

## Como usar

Siga estas etapas simples para começar a usar esta estrutura:

1. Crie um arquivo `.env` na raiz do seu projeto, usando o arquivo `.env.sample` como modelo.

2. No diretório raiz do seu projeto, execute o seguinte comando para iniciar os contêineres Docker em segundo plano:

   ```
   docker-compose up -d
   ```

3. Agora, abra o seu navegador preferido e acesse `http://app.localhost`.

### Como executar seu projeto PHP

Para executar seu projeto PHP neste ambiente Docker, siga as etapas abaixo:

1. Coloque seu projeto dentro da pasta `projects/nome_projeto`, onde `nome_projeto` é o nome do seu projeto.

2. Adicione um novo arquivo de configuração em `nginx/nome_projeto.conf` e cole o seguinte trecho de código:

```nginx
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
}
```

3. Execute o comando `docker restart nginx` para aplicar as configurações.

4. No seu navegador, acesse `http://nome_projeto.localhost` para visualizar o seu projeto PHP.

## Executando o Xdebug com o Visual Studio Code (VSCode)

Para configurar o Xdebug e usar o Visual Studio Code para depurar seu projeto PHP, siga estas etapas:

1. Abra a pasta do seu projeto no Visual Studio Code.

2. No arquivo `launch.json`, adicione a seguinte configuração:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                "/projects/nome_projeto": "${workspaceFolder}"
            },
            "xdebugSettings": {
                "max_children": 128,
                "max_data": -1,
                "max_depth": 3
            },
        }
    ]
}
```

Certifique-se de substituir `nome_projeto` pelo nome da pasta onde está o seu projeto.

## Bibliotecas PHP incluídas

Esta estrutura inclui as seguintes bibliotecas PHP:

- libzip
- libpng
- jpeg
- freetype
- postgresql
- bcmath
- zip
- intl
- gb
- pdo
- pdo_mysql
- pdo_pgsql
- mysqli
- pgsql
- composer
- xdebug

### Remoção de contêineres

Se você deseja remover todos os contêineres e imagens, execute o seguinte comando no ambiente Linux:

```
sh clear-docker.sh
```

Isso garantirá uma limpeza completa dos recursos Docker.