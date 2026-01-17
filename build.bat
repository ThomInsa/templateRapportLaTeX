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
echo === Copie des fichiers glossaires ===
copy /Y %SRC_DIR%\additional_content\glossaries_entries.bib %OUT_DIR%\glossaries_entries.bib

:: --------------------------------------------------
echo === Compilation LaTeX initiale (avec enregistrement) ===
 %TECTONIC% --outdir=%OUT_DIR% --keep-logs --keep-intermediates --reruns 0 %SRC_DIR%\%MAIN_FILE%.tex
 rem Ignorer les erreurs de glossaire manquant lors de la première passe

 echo === Exécution de Biber ===
 %BIBER% --input-directory %OUT_DIR% --output-directory %OUT_DIR% %MAIN_FILE%

echo === Génération des glossaires avec bib2gls ===
cd /d %OUT_DIR%
C:\Users\TA285040\.jdks\temurin-17.0.17\bin\java.exe -jar %PROJECT_DIR%\bib2gls\bib2gls.jar main
cd /d %PROJECT_DIR%


 echo === Compilation LaTeX finale ===
 %TECTONIC% --outdir=%OUT_DIR% --keep-logs --keep-intermediates %SRC_DIR%\%MAIN_FILE%.tex


echo === Compilation terminée ! Le PDF est dans %OUT_DIR% ===
