FROM ubuntu:14.04

MAINTAINER Leonardo Nodari <nodarileonardo@gmail.com>

# Make docker more real
RUN locale-gen en_US.UTF-8 \
    && export LANG=en_US.UTF-8 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       software-properties-common \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Create user, home directory & add it to sudoers
RUN useradd -m valet \
    && echo "valet ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/valet

# Install Dependences
RUN export LANG=en_US.UTF-8 \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y nginx curl zip unzip git \
        php5.6-fpm php5.6-cli php5.6-mcrypt php5.6-mbstring php5.6-xml php5.6-curl \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php

# Configure environment
RUN echo "PATH=\"\$HOME/.composer/vendor/bin:\$PATH\"" >> /home/valet/.profile \
    && echo 'export USER=$(whoami)' >> /home/valet/.profile

# Cleanup
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Insert entrypoint
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/sbin/init"]
