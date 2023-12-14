# #!/bin/bash

# while true
# do
#     # Vérifier si le conteneur SQL-01 est en cours d'exécution
#     if docker inspect -f '{{.State.Running}}' SQL-01 = "running" ; then
#         # Obtenez l'adresse IP du conteneur SQL-01
#         SQL_01_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' SQL-01)

#         # Exécutez mysqldump en utilisant l'adresse IP
#         mysqldump -h $SQL_01_IP -u root -p"root" badass > backup.sql

#         # Copiez le fichier de sauvegarde vers le conteneur SQL-SVG
#         docker cp backup.sql SQL-SVG:/backup.sql
#     else
#         echo "Le conteneur SQL-01 n'est pas en cours d'exécution."
#     fi

#     sleep 10
# done


while true
do
    # Vérifier si le conteneur SQL-01 est en cours d'exécution
    if [ "$(docker inspect -f '{{.State.Running}}' SQL-01)" = "true" ]; then
        # Obtenez l'adresse IP du conteneur SQL-01
        SQL_01_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' SQL-01)

        # Exécutez mysqldump en utilisant l'adresse IP
        mysqldump -h $SQL_01_IP -u root -p"root" badass > backup.sql

        # Copiez le fichier de sauvegarde vers le conteneur SQL-SVG
        docker cp backup.sql SQL-SVG:/backup.sql
    else
        echo "Le conteneur SQL-01 n'est pas en cours d'exécution."
    fi

    sleep 10
done