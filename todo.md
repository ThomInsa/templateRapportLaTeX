# Introduction

- Rapport se veut auto-portant d'où la présence de 3 glossaires et de nombreuses équations / définitions + la dissociation des aspects modélisation et développement

# De l'énergétique du bâtiment au CEA : rappels historiques et contextualisation

## Généralités

- Chiffres-clés = checker document déjà en biblio dernière page

## Direction des énergies et Centre de Grenoble

- Citer livre CEA

## LITEN, INES et DTS

## SIRE et LELA

> Changement dans la hiérarchie à pratiquement tous les niveaux : directeur de labo arrivée en même temps que moi

# Modélisation du comportement thermique d'un bâtiment depuis des données simulées et réelles : approches White-Box et Black-Box

## État de l'art en modélisation de bâtiments : courte étude bibliographique

### Analogie avec les circuits électriques

- Schéma Excalidraw de l'analogie électrique (reprendre cours en ligne partie 6.2)

### Modèle de Contrôle Prédictif pour les bâtiments

- Reproduire figure 1 de MPC needs

### Machine Learning pour le bâtiment

#### Approches traditionnelles

#### Réseaux de neurones


## Modélisation des besoins énergétiques du quartier DISTRISIM

- Diagrame Tikz représentant tout le pipeline de calcul (drafter sur draw.io)
- Figure : courbes de visualisation des données de mesure d'un bâtiment (Thales ou Apache ...)
- Algo : méthode de la sécante
  - Citer num_anal :
    >   Apart from multiple roots, Newton’s Method converges at a faster rate than the bisection
      and FPI methods. It achieves this faster rate because it uses more information—in particular,
      information about the tangent line of the function, which comes from the function’s
      derivative. In some circumstances, the derivative may not be available.
      The Secant Method is a good substitute for Newton’s Method in this case. It replaces the
      tangent line with an approximation called the secant line, and converges almost as quickly.
      Variants of the Secant Method replace the line with an approximating parabola, whose
      axis is either vertical (Muller’s Method) or horizontal (inverse quadratic interpolation). The
      section ends with the description of Brent’s Method, a hybrid method which combines the
      best features of iterative and bracketing methods.

- Reprendre paragraphe 5.1 de TST dans un logigramme 

- Figure : logigramme pour expliquer la démarche pour reproduire figure 18

- Tableau : reproduire figure 18 de TST 
  - l'originale pour harmoniser la charte graphique
  - un nouveau run sur le même bâtiment pour comparer les résultats
  - le même tableau avec les moyennes et écart-types de chaque bâtiment
- Tableau : reproduire figure 14

## Étude et développement de nouvelles approches pour la modélisation énergétiques de bâtiments

Figure introductive : graphe en trois colonnes 
1. Datasets d'entrée
2. Modèles développés
3. Résultats obtenus
Éventuellement 

### Couple modèle-dataset1
### Couple modèle-dataset2
### Couple modèle-datasetN

# Considérations sur l'architecture logicielle du projet \texttt{TherModBuild} : aspects techniques et sécuritaires


## Conception logicielle, refactoring et bonnes pratiques de développement

### Refactoring des précédents travaux

- Citer Clean Code et les bonnes pratiques mises en oeuvre
- Si possible, citer Serious Python
- Donner un listing exemple de fonction refactorisée
- Donner les mêmes courbes (avec Seaborn quand-même) pour montrer que les résultats sont similaires

- Faire un avant / après qualitatif et quantitatif :
  - Nombre de lignes totales
  - Traitement des données
  - Plus longue fonction
  - Plus courte fonction
  - Nombre de fonctions
  - Noms de variables
  - Arborescence de fichiers
  - Fonctions implémentées vs fonctions de librairies
  - Approche objet
  - Gestion de projet (aucune VS Gitlab)
  - Librairies utilisées

Axes d'amélioration (probablement non explorés fin S9)
- Nombre de paramètres d'entrée et de sortie des fonctions

- Assertions et tests autant que possible

### Évaluation qualitative des performances du projet

#### Complexité des algorithmes appelés
- Complexité des algorithmes mis en jeu
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

#### 

Insister sur ce qui est applicable et ce qui ne l'est pas (recommendations des normes VS réalité dans les bureaux)

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

# Conclusion

> Conclure avec l'image cartographie d'IA pour se représenter la multitude d'algos existants et leur portée (conv LinkedIn Selyan)

# Annexes

## "Vrai" contenu
- Fichier readme du projet

### Retour d'expérience

### Organisation

- Deux figures sur le volume horaire
  - Multihistogramme par semaine sur le volume horaire dédié à chaque tâche
  - Répartition horaire totale dans un diagramme circulaire 
    - Développement 
      - dont revues d'issues et rédaction de doc

### Framework

- PyCharm + Dataspell : outil de visualisation et de nettoyage des données pour nettoyer les données d'entrée de TST
- Gitlab pour versionner et gérer le projet : approche agile avec suivi des issues dès que possible
- IntelliJ + Texify pour écrire le rapport + compilateur Tectonic