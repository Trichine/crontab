Effectivement, c'est exact. Lorsque vous exécutez un script SQL dans un conteneur, vous devez vous assurer que le script est accessible à l'intérieur du conteneur et exécuter la commande à partir du contexte du conteneur. Vous pouvez copier le script dans le conteneur avant de l'exécuter, ou bien exécuter le script depuis votre hôte en utilisant la commande docker cp.

Par exemple, pour copier le script dans le conteneur, vous pouvez utiliser la commande docker cp avant d'exécuter la commande MySQL :

bash

docker cp setup.sql SQL-01:/path/to/container/setup.sql docker exec -i SQL-01 mysql -uroot -proot_password < /path/to/container/setup.sql

Assurez-vous d'ajuster /path/to/container/ selon l'emplacement dans le conteneur où vous souhaitez placer le script.

Alternativement, vous pouvez également entrer dans le conteneur et exécuter la commande à partir du shell interne du conteneur, comme ceci :

bash

docker exec -it SQL-01 bash mysql -uroot -proot_password < /path/to/setup.sql exit

Dans ce cas, assurez-vous que le script est dans un chemin accessible depuis le shell du conteneur.

l emplacement

docker exec -it SQL-01 bash pwd exit

docker cp /path/to/host/setup.sql SQL-01:/path/to/container/setup.sql docker exec -i SQL-01 mariadb (je crois) -uroot -proot_password < /path/to/container/setup.sql

apt-get update apt-get install nano

docker run -d --name SQL-01 -e MYSQL_ROOT_PASSWORD=votre_mot_de_passe -e MYSQL_DATABASE=badass -p 3306:3306 mariadb

docker run -d --name SQL-01 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=badass -p 3306:3306 mariadb

docker run -d --name SQL-01 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=badass -e MYSQL_USER=Yan -e MYSQL_PASSWORD=Yan -p 3306:3306 mariadb

docker run -d --name SQL-SVG -e MYSQL_ROOT_PASSWORD=root -p 3307:3306 mariadb

La commande pour remonter la bdd sur SQL-SVG : mariadb -u root -proot badass < backup.sql