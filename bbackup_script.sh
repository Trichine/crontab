#!/bin/bash

while true
do
    # Obtenez l'adresse IP du conteneur SQL-01
    SQL_01_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' SQL-01)

    # Exécutez mysqldump en utilisant l'adresse IP
    mysqldump -h $SQL_01_IP -u root -p"root" badass > backup.sql

    # Copiez le fichier de sauvegarde vers le conteneur SQL-SVG
    docker cp backup.sql SQL-SVG:/backup.sql

    sleep 10
done