#!/bin/bash
#Serveur GLPI
#06/10/2022

echo "Bienvenue dans ce script créé par Sarah Dambielle."
echo -n  "Appuyez sur entrer pour commencer la préparation de votre machine à recevoir GLPI"
read go
echo " "
echo "-------------------------------------------"
echo "Préparation de la machine en cours..."
sudo apt-get update
sudo apt-get upgrade

echo " "
echo "-------------------------------------------"
echo "Suppression des paquets existants en cours..."
echo " "
sudo apt-get remove --purge apache2 php libapache2-mod-php
sudo apt-get remove --purge php-imap php-ldap php-curl php-xmlrpc php-gd php-mysql php-cas php-intl
sudo apt-get remove --purge mariadb-server
sudo apt-get remove --purge apcupsd php-apcu
sudo apt-get remove --purge phpmyadmin
echo " "
echo -n "Suppression des paquets existants terminés. Continuer ?"
read go2

echo " "
echo "-------------------------------------------"
echo "Installation d'Apache 2 en cours..."
echo " "
sudo apt-get install apache2 php libapache2-mod-php
echo " "
echo -n "Installation d'Apache 2 terminée. Continuer ?"
read go3

echo " "
echo "-------------------------------------------"
echo "Installation de PHP en cours..."
echo " "
sudo apt-get install php-imap php-ldap php-curl php-xmlrpc php-gd php-mysql php-cas php-intl
echo " "
echo -n "Installation de PHP terminée. Continuer ?"
read go4

echo " "
echo "-------------------------------------------"
echo "Installation de MariaDB en cours..."
echo " "
sudo apt-get install mariadb-server
echo -n  "Nous allons passer à la configuration de MariaDB. Répondez 'Y' à toutes les questions et suivez les étapes."
read go5
echo " "
sudo mysql_secure_installation
echo " "
echo -n "Installation de MariaDB terminée. Continuer ?"
read go6

echo " "
echo "--------------------------------------------"
echo "Installation des modules complémentaires en cours..."
echo " "
sudo apt-get install apcupsd php-apcu
echo " "
echo -n "Installation des modules complémentaires terminée. Continuer ?"
read go7

echo " "
echo "--------------------------------------------"
echo "Redémarrage des services en cours..."
echo " "
sudo systemctl restart apache2
sudo systemctl restart mysql
echo " "
echo -n "Services redémarrés. Continuer ?" 
read go8

echo " "
echo "--------------------------------------------"
echo "Création de la base de données en cours..."
echo "Entrez les commandes suivantes dans la console MariaDB en suivant bien la syntaxe suivante :"
echo "create database nom_database;"
echo "grant all privileges on nom_database.* to nom_user@localhost identified by 'mdp';"
echo -n "quit"
read go9
sudo mysql -u root -p
echo " "
echo -n "Création de la base de données terminée. Veillez à conserver le mdp renseigné plus tôt. Continuer ?"
read go10

echo " "
echo "--------------------------------------------"
echo "Installation de phpMyAdmin en cours..."
echo "Choississez Apache2 en appuyant sur la barre espace et répondez NON à créer la base avec db_common dans la fenêtre qui va suivre."
echo -n "Appuyez sur entrée pour accéder à la fenêtre"
read go11
echo " "
sudo apt-get install phpmyadmin

echo " "
echo "Préparation de la machine terminée"
echo "--------------------------------------------------"
echo " "
echo -n "Continuer vers l'installation de GLPI ?"
read go12

echo " "
echo "------------------------------------------------"
echo "Installation de GLPI en cours..."
echo " "
cd /usr/src
echo -n "Entrez la version de GLPI souhaitée :"
read version
sudo wget https://github.com/glpi-project/glpi/releases/download/$version/glpi-$version.tgz
sudo tar -xvzf glpi-$version.tgz -C /var/www/html
sudo chown -R www-data /var/www/html/glpi/
echo " "
echo -n "Installation de GLPI terminée. Rendez-vous sur l'interface web de votre serveur afin de configurer GLPI."
read go13
echo " "
echo -n "Aide : https://openclassrooms.com/fr/courses/1730516-gerez-votre-parc-informatique-avec-glpi/5993816-installez-votre-serveur-glpi"
read go14
echo "---------------------------------------------------------------------------------------------------------------------------------------"