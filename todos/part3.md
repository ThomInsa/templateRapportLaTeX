# Considérations sur l'architecture logicielle du projet \texttt{IBIS} : aspects techniques et sécuritaires

## Conception logicielle, refactoring et bonnes pratiques de développement


### Versionnage et gestion de projet
- Suivi du projet = tableau :
  - Tableau des issues ouvertes, en cours et fermées à la fin du S9
  - Tableau similaire pour la fin du S10

## Eléments de sécurisation des algorithmes et bases de données
- Cf Obsidian

### Pratiques sécuritaires de développement pour Python et le calcul scientifique

- Revoir ce que propose Claude
- Bandit + Outils CEA _(demander à Mathieu)_
- Utiliser au maximum des librairies standards pour minimiser le risque d'introduire des vulnérabilités dans le code

### Analyse de risques inhérents au Machine Learning

#### Recommendations générales du NIST et de l'ENISA

- Reprendre tableaux 3 et 4 de Securing Machine Learning Algorithms : 
  - Citer les risques et menaces
- Commenter tableau 5, idéalement expliquer quelles mesures ont été prises
  - Pour RBAC : accès restreint à GitLab
  - Commentaires sur les librairies utilisées

#### Applications au projet IBIS
Insister sur ce qui est applicable et ce qui ne l'est pas (recommendations des normes VS réalité dans les bureaux)

##### Retour sur l'analyse des données et de leurs enjeux de sécurité
| Datasets utilisés         | Intégrité | Sensibilité | Traçabilité | Confidentialité |
|---------------------------|-----------|-------------|-------------|-----------------|
| Projet DISTRISIM          |           |             |             |                 |
| Article de Sartori et al. |           |             |             |                 |
| Maisons INCAS                |           |             |             |                 |


- Reprise du scénario de rapport d'incident sur l'approvisionnement énergétique
##### Pentest sur les données
###### Tentative d'évasion
###### Tentative d'empoisonnement
#### Risques relevés et mesures déployées

| Risque identifié | Parties du code concernées | Modèles impactés | Probabilité d'occurrence | Gravité d'occurrence | Sévérité du risque ($P X G$) | Action de réduction du risque possible |      
|------------------|----------------------------|------------------|--------------------------|----------------------|------------------------------|----------------------------------------|
|                  |                            |                  |                          |                      |                              |                                        |      
|                  |                            |                  |                          |                      |                              |                                        |      
|                  |                            |                  |                          |                      |                              |                                        |      
|                  |                            |                  |                          |                      |                              |                                        |      

  - En particulier, explorer la partie SPECIFIC ML du Tableau 5
    - Donner la procédure pour mener un petit pentest par inférence d'appartenance sur le modèle. Citer le rapport MIA
    - Randomiser les données d'entrée pour compliquer la compréhension du modèle

##### Bilan : vers + de Cyber by design
- Citer AI Cyber and Research : 1.6 et 1.8

## Résultats et failles d'IBIS : une synthèse après un an de développement
