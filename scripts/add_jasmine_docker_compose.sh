#!/bin/bash

# TODO: The spaces in these commands don't translate into the file, everything starts at the beginning of the line. Fix.

# Read: At line 120, Enter insert mode, Supply Message to insert, and lastly (outside of string): File to Modify )
sed -i '112 i jasmine:' docker-compose.yaml
sed -i '113 i build:' docker-compose.yaml
sed -i '114 i         context: .' docker-compose.yaml
sed -i '115 i         dockerfile: docker/dockerfiles/Dockerfile-jasmine' docker-compose.yaml
sed -i '116 i         args:' docker-compose.yaml
sed -i '117 i             - NPM_INSTALL_ARGS' docker-compose.yaml
sed -i '118 i     working_dir: /srv/app/' docker-compose.yaml
sed -i '119 i     ports:' docker-compose.yaml
sed -i '120 i         - "7800:7800"' docker-compose.yaml
sed -i '121 i     volumes:' docker-compose.yaml
sed -i '122 i         - /srv/app/client/js/app-components' docker-compose.yaml
sed -i '123 i         - /srv/app/client/node_modules' docker-compose.yaml
sed -i '124 i         - /srv/app/shared/apps/styles/node_modules' docker-compose.yaml
sed -i '125 i         - /srv/app/shared/apps/quotes/node_modules' docker-compose.yaml
sed -i '126 i         - "./client:/srv/app/client:delegated"' docker-compose.yaml
sed -i '127 i         - "./shared:/srv/app/shared:delegated"' docker-compose.yaml
sed -i '128 i         - "./server/locale:/srv/app/server/locale:delegated"' docker-compose.yaml
sed -i '129 i         - "static-volume:/srv/app/static:z"' docker-compose.yaml
sed -i '130 i     command: http-server -p 7800' docker-compose.yaml
sed -i '131 i     networks:' docker-compose.yaml
sed -i '132 i       app_net:' docker-compose.yaml
sed -i '133 i         ipv4_address: 172.18.1.6' docker-compose.yaml
sed -i '134 i         aliases:' docker-compose.yaml
sed -i '135 i             - sk-jasmine' docker-compose.yaml
