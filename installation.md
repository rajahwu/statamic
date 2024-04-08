# Installation

**Last Updated:** April 8, 2024

## LAPP(n) Stack (Linux, Apache, PostgreSQL, PHP, (Node))

```bash
# Linux (Ubuntu)
lsb_release -a # Output: Ubuntu 20.04.6 LTS

# Apache
apache2ctl -v # Output: Apache/2.4.41 (Ubuntu)

# PostgreSQL
psql --version # Output: (PostgreSQL) 12.18

# PHP
php --version # Output: PHP 8.2.17

# Node
nvm use 18 # Output: Now using node v18.18.0 (npm v10.4.0)

```

Install [PHP & Required Models](https://www.php.net/)

```bash
sudo apt install php-common php-fpm php-json php-mbstring zip unzip php-zip php-cli php-xml php-tokenizer -y
```

Install [composer](https://getcomposer.org/)

## Statamic Standalone (default)

```bash
composer create-project --prefer-dist statamic/statamic {site name} # Replace site name with actual site name 
```

### Add db credentials to .env

```sh
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=[database_name] # Replace [database_name] with your actual database name
DB_USERNAME=postgres
DB_PASSWORD=[password] # Replace [password] with your actual database password

```

### Migrate

```bash
php artisan migrate:fresh
```

## Statamic Standalone (add starter-kit)

```bash
# php please start-kit:install statamic/{package_name} # Replace {package_name} with the name of the starter-kit
php please starter-kit:install statamic/starter-kit-starters-creek
npm i && npm run watch  # Build JavaScript and run server with watch flag
```

## Statamic in Laravel 

### [Start Laravel Project](https://laravel.com/docs/11.x/installation)

```bash
# statamic needs laravel version 10
composer create-project laravel/laravel:^10.0 [project_name] # Replace [project_name] with actual name of project
```

### Add db credentials to .env

```sh
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=[database_name] # Replace [database_name] with your actual database name
DB_USERNAME=postgres
DB_PASSWORD=[password] # Replace [password] with your actual database password

```

### Migrate

```bash
php artisan migrate:fresh
```
### Run server

```bash
php artisan serve
```

### [Install Statamic](https://statamic.dev/installing)

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
        "@php artisan statamic:install --ansi",  # <-- Add this line (comment only)
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
php please start-kit:install statamic/{package_name} # Replace {package_name} with the name of the starter-kit
npm i && npm run watch  # Build JavaScript and run server with watch flag
```


