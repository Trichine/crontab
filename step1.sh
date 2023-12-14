#!/bin/bash

# # Premier conteneur
# docker run -d --name SQL-01 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=badass -e MYSQL_USER=Yan -e MYSQL_PASSWORD=Yan -p 3306:3306 mariadb
# docker exec -i SQL-01 mariadb -uroot -proot < setup.sql

# # Deuxième conteneur
# docker run -d --name SQL-SVG -e MYSQL_ROOT_PASSWORD=root_password -e MYSQL_DATABASE=badass -e MYSQL_USER=Yan -e MYSQL_PASSWORD=Yan -p 3307:3306 mariadb
# docker exec -i SQL-SVG mariadb -uroot -proot < setup.sql

# # Script de sauvegarde
# ./backup_script.sh

# # Restaurer la sauvegarde dans le premier conteneur
# docker exec -i SQL-01 mariadb -uroot -proot badass < backup.sql




# #!/bin/bash

# # Premier conteneur
# docker run -d --name SQL-01 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=badass -e MYSQL_USER=Yan -e MYSQL_PASSWORD=Yan -p 3306:3306 mariadb
# docker exec -i SQL-01 mariadb -uroot -proot < setup.sql

# # Deuxième conteneur
# docker run -d --name SQL-SVG -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=badass -e MYSQL_USER=Yan -e MYSQL_PASSWORD=Yan -p 3307:3306 mariadb
# ./backup_script.sh

# # Restaurer la sauvegarde dans le premier conteneur
# docker exec -i SQL-01 mariadb -uroot -proot badass < backup.sql



# mariadb -u root -proot




#!/bin/bash

# Premier conteneur
docker run -d --name SQL-01 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=badass -e MYSQL_USER=abou -e MYSQL_PASSWORD=abou -p 3306:3306 mariadb

# Attendre que le serveur MariaDB soit prêt
echo "Attente du démarrage du serveur MariaDB..."
sleep 10  # Vous pouvez ajuster ce délai en fonction de vos besoins

# Exécuter le script setup.sql
docker exec -i SQL-01 mariadb -uroot -proot < setup.sql

# Deuxième conteneur
docker run -d --name SQL-SVG -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=badass -e MYSQL_USER=abou -e MYSQL_PASSWORD=abou -p 3307:3306 mariadb
./backup_script_verifying.sh

# Restaurer la sauvegarde dans le premier conteneur
docker exec -i SQL-01 mariadb -uroot -proot badass < backup.sql