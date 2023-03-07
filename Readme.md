# Projet RLA
Source du projet Robot Lièvre d'Athlétisme pour l'UE projet thématique du Master Ingénierie des Systèmes et Réseaux Informatique, le projet a pour but de développer une application permettant de controller un robot afin d'assister un coureur dans le but de réguler sa course.

## Installation
Récupération du projet git
```
git clone https://github.com/Adrien-Courtois/RLA-projet.git
```
Construction du container docker
```
./build.sh
```

## Lancement
Lancement du container docker
```
./run.sh
```

## Inventaire

* `profile` : Dossier contenant les fichiers d'installation d'Android Studio 
* `projet` : Dossier contenant les projets partagés avec le container
* `build.sh` : Script permettant de construire le container docker
* `run.sh` : Script permettant de lancer le container docker 
* `dockerfile` : Fichier de build du container docker
