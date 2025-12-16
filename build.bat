@echo off
:: --------------------------------------------------
:: Script simplifié pour Tectonic + Biber + glossaires
:: --------------------------------------------------

:: Chemins vers les exécutables
set TECTONIC="C:\Users\TA285040\Documents\Alternance\Livrables\templateRapportLaTeX\tectonic.exe"
set BIBER="C:\Users\TA285040\Documents\Alternance\Livrables\templateRapportLaTeX\biber.exe"
set MAKEGLOSSARIES="C:\Users\TA285040\Documents\Alternance\Livrables\templateRapportLaTeX\glossaries\makeglossaries-lite.lua"

:: Chemins absolus vers les dossiers du projet
set PROJECT_DIR="C:\Users\TA285040\Documents\Alternance\Livrables\templateRapportLaTeX"
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
echo === Compilation LaTeX initiale ===
%TECTONIC% --outdir=%OUT_DIR% --keep-logs --reruns 0 %SRC_DIR%\%MAIN_FILE%.tex
if errorlevel 1 (
    echo Erreur lors de la compilation LaTeX. Arrêt.
    pause
    exit /b 1
)

echo === Exécution de Biber ===
%BIBER% --input-directory %OUT_DIR% --output-directory %OUT_DIR% %MAIN_FILE%
if errorlevel 1 (
    echo Erreur lors de Biber. Arrêt.
    pause
    exit /b 1
)

echo === Génération des glossaires ===
cd /d %OUT_DIR%
texlua %MAKEGLOSSARIES% %MAIN_FILE%
if errorlevel 1 (
    echo Avertissement : Erreur lors de makeglossaries (peut être ignoré si les fichiers .gls existent)
)
cd /d %PROJECT_DIR%

echo === Compilation LaTeX pour bibliographie et glossaires (2/2) ===
%TECTONIC% --outdir=%OUT_DIR% --keep-logs --reruns 0 %SRC_DIR%\%MAIN_FILE%.tex
if errorlevel 1 (
    echo Erreur lors de la compilation LaTeX. Arrêt.
    pause
    exit /b 1
)

echo === Compilation finale pour mises à jour des références (3/3) ===
%TECTONIC% --outdir=%OUT_DIR% --keep-logs %SRC_DIR%\%MAIN_FILE%.tex
if errorlevel 1 (
    echo Erreur lors de la compilation LaTeX. Arrêt.
    pause
    exit /b 1
)

echo === Compilation terminée ! Le PDF est dans %OUT_DIR% ===
pause
