# Infrastructure

## Pre-preparation:
* Rename `.env.example` to `.env`
* Replace the database password in `.env` with your own
* Add to your local PC `host` file: <br>
  `127.0.0.1 postgresql` <br>
  `127.0.0.1 admin-service.ru`

## Installing the Admin panel
`composer install` <br>
`npm install` <br>
`php artisan migrate` <br>
`php artisan filament-access-control:install` <br>
`php artisan filament-access-control:user` <br>
`php artisan config:cache && php artisan route:cache && php artisan view:cache && composer dump-autoload -o` <br>
`php artisan icons:cache && php artisan filament:cache-components && php artisan optimize`

Then go to the http://admin-service.ru:8000/admin/login and enter by your login and pass. Which you created in the console in command: `filament-access-control:user` 

**P.S.** If you have 500 error, try to remove `app/bootstrap/cache/config.php` file cache. Don't know why it happen after caching :|
