#!/bin/bash
# Change access rights for the Laravel folders
# in order to make Laravel able to access
apt update && \
# cache and logs folder.
chgrp -R www-data storage bootstrap/cache && \
chown -R www-data storage bootstrap/cache && \
chmod -R 775 storage bootstrap/cache && \

chgrp -R www-data storage storage/framework/cache && \
chown -R www-data storage storage/framework/cache && \
chmod -R 775 storage storage/framework/cache && \

chgrp -R www-data storage storage/app && \
chown -R www-data storage storage/app && \
chmod -R 775 storage storage/app && \

chgrp -R www-data storage storage/framework/views && \
chown -R www-data storage storage/framework/views && \
chmod -R 775 storage storage/framework/views && \

chgrp -R www-data storage storage/logs && \
chown -R www-data storage storage/logs && \
chmod -R 775 storage storage/logs && \

# Create the symbolic link
ln -s public html && \

# access to the folder structure
composer install && composer require predis/predis && \

php artisan key:generate && \
php artisan migrate:fresh --seed && echo "Done..."
