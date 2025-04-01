#!/bin/bash

docker run --name woocommerce_cli  -it --rm -v "$(pwd)":"/var/www/html"   myridia/wordpress_cli
