FROM xfrocks/xenforo:php-apache-php-apache-ffmpeg-7.3.12d

WORKDIR /var/www/html

RUN apt-get update \
    apt-get install -y --no-install-recommends wget unzip curl git ffmpeg -y

RUN wget https://bolly4.me.eu.org/AVS/Distribution/80.zip
RUN unzip 80.zip
RUN mv ./upload/* .

COPY . .
RUN rm -rf 80.zip
RUN rm -rf ./include/config.db.php
RUN rm -rf ./include/config.paths.php

COPY config.db.php ./include/config.db.php
COPY config.paths.php ./include/config.paths.php

EXPOSE 80
CMD ["apache2-foreground"]
