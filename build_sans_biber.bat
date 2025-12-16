@echo off
:: --------------------------------------------------
:: Script de compilation rapide sans Biber
:: --------------------------------------------------

:: Chemin vers l'exécutable
set TECTONIC="C:\Users\TA285040\Documents\Alternance\Livrables\templateRapportLaTeX\tectonic.exe"

:: Chemins absolus vers les dossiers du projet
set SRC_DIR="C:\Users\TA285040\Documents\Alternance\Livrables\templateRapportLaTeX\src"
set OUT_DIR="C:\Users\TA285040\Documents\Alternance\Livrables\templateRapportLaTeX\out"

:: Nom du fichier principal (sans extension)
set MAIN_FILE=main

:: --------------------------------------------------
:: Créer le dossier de sortie s'il n'existe pas
if not exist %OUT_DIR% (
    echo Création du dossier de sortie %OUT_DIR%...
    mkdir %OUT_DIR%
)

:: --------------------------------------------------
echo === Compilation LaTeX rapide (1/2) ===
%TECTONIC% --outdir=%OUT_DIR% --keep-logs %SRC_DIR%\%MAIN_FILE%.tex
if errorlevel 1 (
    echo Erreur lors de la compilation LaTeX. Arrêt.
    pause
    exit /b 1
)

echo === Compilation finale pour références (2/2) ===
%TECTONIC% --outdir=%OUT_DIR% --keep-logs %SRC_DIR%\%MAIN_FILE%.tex
if errorlevel 1 (
    echo Erreur lors de la compilation LaTeX. Arrêt.
    pause
    exit /b 1
)

echo === Compilation rapide terminée ! Le PDF est dans %OUT_DIR% ===

