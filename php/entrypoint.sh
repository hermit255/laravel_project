APP_DIR=/app/
CJSON=${APP_DIR}composer.json

echo $1
if [ ! -e $CJSON ]; then
  # on no composer.json
  composer create-project laravel/laravel --prefer-dist .
elif [ "$1" = 'install' ]; then
  # on node_modules empty and has package.json
  echo 'INFO: laravel project is not installed.'
  echo 'INFO: installing laravel project.'
  INSTALL=
  composer install ${INSTALL}
  chown -R $UID $APP_DIR
else
  echo 'INFO: laravel project detected.'
  php artisan serve --host 0.0.0.0
fi
