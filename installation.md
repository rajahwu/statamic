# Installation

## LAPP(n) Stack (Linux, Apache, PostgreSQL, PHP, (Node))

```bash
# Linux (Ubuntu)
lsb_release -a # Output: Ubuntu 20.04.6 LTS

# Apache
apache2ctl -v # Output: Apache/2.4.41 (Ubuntu)

# PostgreSQL
psql --version # Output: PostgreSQL X.X.X

# PHP
php --version # Output: PHP 8.2.17

# Node
nvm use 18 # Output: Now using node v18.18.0 (npm v10.4.0)
```

Install [composer](https://getcomposer.org/)

## Statamic Standalone (default)


## Statamic Standalone (w/ starter-kit)

## Statamic in Laravel 

### Start Laravel Project

```bash
composer create-project laravel/laravel:^10.0 [project_name] # statamic need laravel version 10
```

### Add db credentials to .env

```
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=[database_name]
DB_USERNAME=postgres
DB_PASSWORD=[password]
```

### Migrate

```bash
php artisan migrate:fresh
```

### Run server

```bash
php artisan serve
```

### Install Statamic

#### Clear config cache

```bash
php artisan config:clear
```

#### Add **statamic:install** to **post-autoload-dump** in **composer.json**

```json
"scripts": {
    "post-autoload-dump": [
        "Illuminate\\Foundation\\ComposerScripts::postAutoloadDump",
        // "@php artisan package:discover --ansi",
        "@php artisan statamic:install --ansi",  # Add this line
        // "@php artisan statamic:search:update --all --ansi",
        // "@php artisan statamic:static:clear --ansi"
    ],
}
```
#### Install **statamic/cms**

```bash
composer require statamic/cms --with-dependencies
```

### Add statamic [starter-kit](https://statamic.com/starter-kits)

```bash
php please start-kit:install statamic/{package_name}
npm i && npm run watch # build js and run server with watch flag
```


