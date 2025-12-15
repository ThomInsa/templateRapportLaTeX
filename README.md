# Template Rapport LaTeX

Template LaTeX pour la rédaction de rapports, utilisant Tectonic et Biber pour la gestion de la bibliographie.

## Prérequis

- Tectonic (moteur LaTeX)
- Biber (pour la gestion de la bibliographie)

## Compilation

Pour compiler le document, utilisez le script `build.bat` (Windows) :

```bash
build.bat
```

Ce script effectue les étapes suivantes :
1. Compilation LaTeX initiale pour générer les fichiers auxiliaires
2. Exécution de Biber pour traiter la bibliographie
3. Recompilations LaTeX pour intégrer la bibliographie et résoudre les références

## Structure du projet

```
├── src/              # Fichiers sources LaTeX
│   ├── main.tex      # Fichier principal
│   ├── main.bib      # Bibliographie
│   ├── biblio/       # Configuration bibliographie
│   ├── parametres/   # Paramètres et packages
│   └── ...
├── out/              # Dossier de sortie (généré automatiquement)
└── build.bat         # Script de compilation
```

## Résolution des problèmes courants

### Erreur "main.bcf not found" avec Biber

Si vous rencontrez une erreur indiquant que le fichier `main.bcf` est manquant dans le dossier `out/`, cela signifie que les fichiers de contrôle de Biber n'ont pas été générés correctement.

**Solution :**

Le fichier `.bcf` est un fichier de contrôle généré automatiquement pendant la compilation LaTeX. Pour le régénérer :

1. **Option 1 : Recompiler complètement**
   ```bash
   # Supprimez le dossier out/ et recompilez
   rmdir /s /q out
   build.bat
   ```

2. **Option 2 : Compilation manuelle étape par étape**
   ```bash
   # Créer le dossier out/ s'il n'existe pas
   mkdir out
   
   # Première compilation LaTeX pour générer main.bcf
   tectonic --outdir=out --keep-logs src\main.tex
   
   # Exécuter Biber (maintenant main.bcf existe)
   biber --input-directory out --output-directory out main
   
   # Recompilations finales
   tectonic --outdir=out --keep-logs src\main.tex
   tectonic --outdir=out --keep-logs src\main.tex
   ```

**Explication :** Le fichier `.bcf` (BibTeX Control File) est créé par biblatex pendant la première compilation LaTeX. Il contient les instructions pour Biber sur la façon de traiter les citations et la bibliographie. Si ce fichier est supprimé, il suffit de relancer la première étape de compilation pour le recréer.

### Autres erreurs de compilation

- Vérifiez que tous les packages LaTeX nécessaires sont installés
- Assurez-vous que les chemins dans `build.bat` sont corrects
- Consultez les fichiers `.log` dans le dossier `out/` pour plus de détails sur les erreurs

## Notes importantes

- Le dossier `out/` contient les fichiers générés lors de la compilation (PDF, fichiers auxiliaires, logs). Ces fichiers sont exclus du contrôle de version via `.gitignore`.
- Ne commitez pas les fichiers `.bcf`, `.aux`, `.log`, etc. Ces fichiers sont recréés à chaque compilation.

## Configuration personnalisée

Pour adapter le template à vos besoins, modifiez :
- `src/main.tex` : Structure du document
- `src/parametres/` : Paramètres et packages LaTeX
- `src/biblio/bibConfig.tex` : Configuration de la bibliographie
- `build.bat` : Chemins vers les exécutables (à adapter selon votre installation)
