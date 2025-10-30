FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www/html

# Install dependencies untuk PostgreSQL dan PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip \
    libpq-dev git curl \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy semua file project
COPY . .

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install dependencies Laravel
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Expose port Laravel
EXPOSE 3002

# Command untuk menjalankan Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=3002"]
