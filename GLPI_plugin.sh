#!/bin/bash
#Serveur GLPI
#06/10/2022

echo "Bienvenue dans ce script créé par Sarah Dambielle."
echo "Ce script permet d'installer et de configurer le plugin FusionInventory pour votre serveur GLPI."
echo -n "Appuyez sur entrée pour commencer :"
read go

echo " "
echo "-------------------------------------------"
echo "Mise à jour du système en cours"
echo " "
sudo apt-get update && apt-get upgrade
sudo rm -r /var/www/html/glpi/plugins
echo "Mise à jour du système terminée"
echo " "

echo "-------------------------------------------"
echo " "
echo -n "Renseignez la version de GLPI installée sur votre serveur :"
read versionglpi
echo -n "Renseignez la version du plugin FusionInventory à installer :"
read versionplugin
cd /usr/src

echo " "
echo "Téléchargement du plugin en cours..."
sudo wget https://github.com/fusioninventory/fusioninventory-for-glpi/archive/glpi$versionglpi+$versionplugin.tar.gz
sudo tar -zxvf glpi$versionglpi+$versionplugin.tar.gz -C /var/www/html/glpi/plugins
echo -n "Téléchargement du plugin terminé. Continuer ?"
read go1

echo " "
echo "--------------------------------------------"
echo "Attribution des droits d'accès en cours..."
echo " "
sudo chown -R www-data /var/www/html/glpi/plugins
echo -n "Attribution des droits d'accès terminée. Continuer ?"
read go2

echo " "
echo "--------------------------------------------"
echo "Préparation de la compatibilté du répertoire en cours..."
echo " "
cd /var/www/html/glpi/plugins
sudo mv fusioninventory-for-glpi-glpi$versionglpi-$versionplugin/ fusioninventory/
echo " "
echo "Préparation de la compatibilité du répertoire terminée. Continuer ?"

echo -n "Fin du script."
read go3

echo " "
echo "Finalisez l'installation sur l'interface web."
echo -n "Aide : https://openclassrooms.com/fr/courses/1730516-gerez-votre-parc-informatique-avec-glpi/5994176-installez-le-plugin-et-l-agent-fusioninvent>
read go4
echo "------------------------------------------------------------------------------------------------------------------------------------------------"
echo " "