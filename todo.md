# Introduction

- Rapport se veut auto-portant d'où la présence de 3 glossaires et de nombreuses équations / définitions + la dissociation des aspects modélisation et développement

# De l'énergétique du bâtiment au CEA : rappels historiques et contextualisation

## Généralités
## Direction des énergies et Centre de Grenoble
## LITEN, INES et DTS

## SIRE et LELA

> Changement dans la hiérarchie à pratiquement tous les niveaux : directeur de labo arrivée en même temps que moi

# Modélisation du comportement thermique d'un bâtiment depuis des données simulées et réelles : approches White-Box et Black-Box

## État de l'art en modélisation de bâtiments : courte étude bibliographique

### Modèle de Contrôle Prédictif pour les bâtiments
### Machine Learning pour le bâtiment

#### Approches traditionnelles
#### Réseaux de neurones

## Modélisation des besoins énergétiques du quartier DISTRISIM

### Position du problème

- Introduire et expliquer chaque paramètre

- Considérations sur la fonction \textit{(convexe, différentiable etc)} pour poser le contexte de l'optimisation 

- Figure : courbes de visualisation des données de mesure d'un bâtiment (Thales ou Apache ...)
- Algo : méthode de la sécante

- Figure : Reprendre paragraphe 5.1 de TST dans un logigramme 

- Figure : logigramme pour expliquer la démarche pour reproduire figure 18
### Rapide analyse des données d'entrée


## Étude et développement de nouvelles approches pour la modélisation énergétique de bâtiments

>Encadré : Réflexion de proche en proche, en essayant de se baser sur les travaux précédemment conduits. C'est pourquoi les conclusions présentées ici sont similaires aux précédentes. 

### Retour sur la méthode de la sécante : généralisation et perfectionnement


### Autres méta-heuristiques

- Principal avantage de la PSO = ne pas utiliser le gradient de la fonction, et donc pas besoin que la fonction soit dérivable
- Avantage relatif dans le sens où notre fonction est différentiable
- Il a été considéré de changer la fonction objectif mais celle-ci étant très standard _(RMSE)_, ce n'est pas la priorité


# Considérations sur l'architecture logicielle du projet \texttt{IBIS} : aspects techniques et sécuritaires

## Conception logicielle, refactoring et bonnes pratiques de développement

### Refactoring des précédents travaux

- Citer Clean Code et les bonnes pratiques mises en oeuvre
- Si possible, citer Serious Python

- Donner un listing exemple de fonction refactorisée

Axes d'amélioration (probablement non explorés fin S9)
- Nombre de paramètres d'entrée et de sortie des fonctions
- Assertions et tests autant que possible

#### Approche orientée objet

#### Utilisation de librairies standards

- Parler du tradeoff entre l'introduction de dépendances aux librairies et le gain métier / sécu

#### Vers un modèle de données uniformisé

  - Ajd on est sur un modèle relationnel sans le dire
  - Colonnes pas normalisées = mauvais point de départ pour de l'analyse
  - Besoin d'avoir le même dataset pour chaque bâtiment
  - Évolution vers une BDD standard nécessaire _(SQLite)_
  - Interroger le modèle relationnel va sans doute permettre une meilleure intégration des composants

### Évaluation qualitative des performances du projet


#### Complexité des algorithmes appelés
- Complexité des algorithmes mis en jeu
- PSO : citer NIA p33 5.4 pour complexité 
- Trouver complexité du solveur d'Euler et de la méthode de Newton
#### Outils retenus pour garantir la performance


##### \texttt{uv} plutôt que \texttt{conda} ou \texttt{pip}
##### Polars plutôt que Pandas
- Benchmark Pandas vs Polars _(avec petite introduction sur les deux librairies)_
- Tableau de lancement d'algos entre pandas et Polars

## Eléments de sécurisation des algorithmes et bases de données
- Cf Obsidian

### Pratiques sécuritaires de développement pour Python et le calcul scientifique

- Revoir ce que propose Claude
- Bandit + Outils CEA _(demander à Mathieu)_
- Utiliser au maximum des librairies standards pour minimiser le risque d'introduire des vulnérabilités dans le code

### Analyse de risques inhérents au Machine Learning

#### Recommendations générales du NIST et de l'ENISA

- Aspects data : citer 5.2.2 Reco 3 de cybersecurity OF AI and standardisation
- Citer AI Cyber and Research : 1.6 et 1.8
- Reprendre tableaux 3 et 4 de Securing Machine Learning Algorithms : les adapter au code et mener une étude qualitative
- Commenter tableau 5, idéalement expliquer quelles mesures ont été prises
  - Pour RBAC : accès restreint à GitLab
  - Intégrité, sensibilité, traçabilité et confidentialité des données
  - Commentaires sur les librairies utilisées
  - En particulier, explorer la partie SPECIFIC ML du Tableau 5
    - Donner la procédure pour mener un petit pentest par inférence d'appartenance sur le modèle. Citer le rapport MIA
    - Randomiser les données d'entrée pour compliquer la compréhension du modèle

#### Applications au projet IBIS

Insister sur ce qui est applicable et ce qui ne l'est pas (recommendations des normes VS réalité dans les bureaux)

- + de Cyber by design puisque ce travail bibliographique va nourrir les prochaines réflexions

- Reprise du scénario de rapport d'incident sur l'approvisionnement énergétique

| Datasets utilisés         | Intégrité | Sensibilité | Traçabilité | Confidentialité |
|---------------------------|-----------|-------------|-------------|-----------------|
| Projet DISTRISIM          |           |             |             |                 |
| Article de Sartori et al. |           |             |             |                 |
|                           |           |             |             |                 |


Tableau d'analyse du risque :

| Risque identifié | Parties du code concernées | Modèles impactés | Probabilité d'occurrence | Gravité d'occurrence | Sévérité du risque ($P X G$) | Action de réduction du risque possible |      
|------------------|----------------------------|------------------|--------------------------|----------------------|------------------------------|----------------------------------------|
|                  |                            |                  |                          |                      |                              |                                        |      
|                  |                            |                  |                          |                      |                              |                                        |      
|                  |                            |                  |                          |                      |                              |                                        |      
|                  |                            |                  |                          |                      |                              |                                        |      

## Versionnage et gestion de projet
- Suivi du projet = tableau :
    - Tableau des issues ouvertes, en cours et fermées à la fin du S9
    - Tableau similaire pour la fin du S10 

- Bonne pratique adoptée : ne jamais push sans update la documentation
- Autre bonne pratique : après chaque gros commit, vérifier les résultats avec le notebook [mean_err_by_building_by_month.ipynb](../../Projets/IBIS/TSA_Proj/TST_rehandled/DISTRISIM_energy_prediction/notebooks/mean_err_by_building_by_month.ipynb) pour reproduire la grosse figure (remplace un pipeline CI/CD complet) 
# Conclusion

> La synthèse des cinq premières semaines d'alterance  
> En particulier, la portée et la limite de plusieurs algorithmes permettant de modéliser le comportement énergétique d'un bâtiment ont été présentées \textit{Optimisation par Essaim de Particules (PSO), Méthode de la sécante ...)} en s'appuyant sur des données simulées d'un précédent projet.
> Par ailleurs, . Enfin, une analyse de l'architecture logicielle du projet a été menée. Celle-ci est très largement complétable mais peut servir de support pour de futurs travaux plus ambitieux.

> Conclure avec l'image cartographie d'IA pour se représenter la multitude d'algos existants et leur portée (conv LinkedIn Selyan)

# Annexes

## "Vrai" contenu
- Fichier readme du projet

### Retour d'expérience

### Organisation

- Planning de l'alternance par phases

### Framework

- PyCharm + Dataspell : outil de visualisation et de nettoyage des données pour nettoyer les données d'entrée de TST
- Gitlab pour versionner et gérer le projet : approche agile avec suivi des issues dès que possible
- IntelliJ + Texify pour écrire le rapport + compilateur Tectonic