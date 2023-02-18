= Docker PHP
Estrutura docker para rodar projetos em PHP com integração ao banco de dados Mysql e Nginx.

== Como utilizar?
- Crie um arquivo .env na raiz do projeto utilizando o arquivo `.env_model` como modelo. Neste arquivo é necessário passar as credenciais de desejo da banco de dados. Caso a aplicação não possua conexão com banco de dados, essa etapa pode ser ignorada.
- Adicione seu projeto PHP dentro da pasta php/app. 
- Execute o comando `docker compose up -d` na raiz do projeto.
- Acesse app.localhost no seu navegador de preferência
