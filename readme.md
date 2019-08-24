# Laravel Nginx PHP Redis MySQL 

Docker adminstração de Laravel, Nginx, PHP-FPM, Redis e MySQL.

**ESTE AMBIENTE SÓ DEVE SER USADO PARA O DESENVOLVIMENTO!**

**ATENÇÃO**: Não use em produção.

## Images usadas

* [Nginx - PHP-FPM](https://hub.docker.com/r/wyveo/nginx-php-fpm/)
* [MySQL](https://hub.docker.com/_/mysql/)
* [phpMyAdmin](https://hub.docker.com/r/phpmyadmin/phpmyadmin/)
* [Gerar Certificado](https://hub.docker.com/r/jacoelho/generate-certificate/) 

## Comece a usá-lo

1. Baixe :

    ```sh
    git clone https://github.com/williamsduarte/docker-nginx-php-redis-mysql.git
    ```
    
2. Entre na pasta do projeto :

    ```sh
    cd docker-nginx-php-redis-mysql
    ```
    
3. **Importante!** Baixe o pacote Laravel com o seguinte alias **src** :

    ```sh
    git clone https://github.com/laravel/laravel.git src
    ```

4. No arquivo **src/.env** do Laravel, defina as seguintes variáveis de ambiente para:     
    
    ```env
    DB_CONNECTION=mysql
    DB_HOST=db
    DB_PORT=3306
    DB_DATABASE=app_development
    DB_USERNAME=root
    DB_PASSWORD=secret

    ...

    CACHE_DRIVER=redis
    QUEUE_CONNECTION=redis
    SESSION_DRIVER=redis

    ...

    REDIS_HOST=redis 
	```

5. Faça do setup.sh um executável :

   ```sh
   sudo chmod +x setup.sh
   ```  

6. Para instalar execute o comando abaixo :

    ```sh
    sudo docker-compose up -d && echo "Por favor, aguarde enquanto o serviço é ..." && sleep 5 && docker exec myapp-web /usr/share/nginx/setup.sh && echo "Tudo feito"
    ```

7. Para acessar o Laravel :

    * [http://localhost:8000](http://localhost:8000/)
    * [https://localhost:3000](https://localhost:3000/) ([HTTPS](https://github.com/nanoninja/docker-nginx-php-mongo#generating-ssl-certificates) não configurado por padrão)

8. Para acessar o phpMyAdmin :

    * [http://localhost:8080](http://localhost:8080/)    

## Diretório 


```sh
docker-nginx-php-redis-mysql
├── README.md
├── bin
│   └── linux
│       └── clean.sh
├── data
│   └── db
│       ├── dumps
│       └── mysql
├── docker-compose.yml
├── Dockerfile
├── etc
│   ├── nginx
│   │   └── default.conf
│   ├── php
│   │   └── php.ini
│   └── ssl
├── setup.sh
└── src (Laravel)
```

## Limpar Projeto

**Aviso**: Apaga todos os containers e volumes.

```sh
./bin/linux/clean.sh $(pwd)
```
