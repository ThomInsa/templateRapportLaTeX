
# Modélisation semi-physique du comportement thermique d'un bâtiment depuis des données simulées et réelles 
## État de l'art en modélisation de bâtiments : courte étude bibliographique

### Modèle de Contrôle Prédictif pour les bâtiments
### Machine Learning pour le bâtiment

#### Approches traditionnelles
#### Réseaux de neurones

## IBIS : Une approche modulaire pour l'analyse de données hétérogènes dans différents contextes
### Genèse et raison d'être du projet

### Point de départ sur un modèle simple et des données simulées : besoins énergétiques du quartier Cambridge dans le cadre du projet DISTRISIM

#### Position du problème

#### Rapide analyse des données d'entrée
- Expliquer que les séries ont une allure relativement similaire ce qui justifie une analyse de leur distribution statistique indépendamment des relations temporelles d'une température à l'autre dans un premier temps _(on peut tirer quelque chose de cette analyse ce qui ne serait pas vrai si les saisonnalités étaient très différentes, en revanche on ne peut pas s'y limiter)_
- Algo / équation : Lowess
#### Modèle et résolution
- Introduire et expliquer chaque paramètre
    - Notamment, petite note de bas de page pour expliquer le besoin de linéarité qui pousse à choisir $k_1$ et $k_2$ _(cf OneNote Antoine)_

- Considérations sur la fonction \textit{(convexe, différentiable etc)} pour poser le contexte de l'optimisation
##### Fonctions objectifs 

#### Promesses et limites
##### Outils proposés par le précédent projet puis abandonnés en cours de route
##### Bornes de l'espace de recherche
- Figure : évolution des paramètres $RC$ évalués finement par PSO
- Changer figure main test

### Étude et intégration de nouvelles approches pour la modélisation énergétique de bâtiments
#### Autres modèles $RC$

Préciser les noeuds de température impliqués à chaque fois, et dans quel ordre

>Réflexion de proche en proche, en essayant de se baser sur les travaux précédemment conduits. C'est pourquoi les conclusions présentées ici sont similaires aux précédentes.

