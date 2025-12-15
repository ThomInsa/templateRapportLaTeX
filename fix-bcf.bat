@echo off
:: --------------------------------------------------
:: Script pour régénérer le fichier main.bcf manquant
:: Ce script résout l'erreur "main.bcf not found" de Biber
:: --------------------------------------------------

echo ========================================
echo Fix pour fichier main.bcf manquant
echo ========================================
echo.

:: Chemins vers les exécutables (à adapter selon votre installation)
set TECTONIC="C:\Users\TA285040\Documents\Alternance\Livrables\templateRapportLaTeX\tectonic.exe"
set SRC_DIR="C:\Users\TA285040\Documents\Alternance\Livrables\templateRapportLaTeX\src"
set OUT_DIR="C:\Users\TA285040\Documents\Alternance\Livrables\templateRapportLaTeX\out"
set MAIN_FILE=main

echo Etape 1: Création du dossier de sortie...
if not exist %OUT_DIR% (
    mkdir %OUT_DIR%
    echo Dossier %OUT_DIR% créé.
) else (
    echo Dossier %OUT_DIR% existe déjà.
)

echo.
echo Etape 2: Compilation LaTeX pour générer main.bcf...
echo (Cette étape crée automatiquement le fichier .bcf nécessaire à Biber)
echo.

%TECTONIC% --outdir=%OUT_DIR% --keep-logs %SRC_DIR%\%MAIN_FILE%.tex

if errorlevel 1 (
    echo.
    echo ERREUR: La compilation LaTeX a échoué.
    echo Vérifiez les logs dans le dossier %OUT_DIR%
    pause
    exit /b 1
)

echo.
echo ========================================
echo SUCCES: Le fichier main.bcf a été régénéré !
echo ========================================
echo.
echo Le fichier main.bcf est maintenant disponible dans %OUT_DIR%
echo Vous pouvez maintenant exécuter build.bat pour compiler complètement.
echo.
pause
