@echo off
setlocal enabledelayedexpansion

echo ========================================================
echo   WARJ-GROUP - Configurando Ambiente DOCUMENTACAO
echo ========================================================

:: 1. Verificar npm
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERRO] npm nao encontrado. Por favor, instale o Node.js.
    pause
    exit /b 1
)

echo [1/3] Instalando dependencias minimas (Lint + Husky)...
call npm init -y
call npm install --save-dev husky @commitlint/cli @commitlint/config-conventional markdownlint-cli

echo [2/3] Inicializando Husky...
call npm exec husky init

echo [3/3] Configurando Hooks de seguranca...

:: Hook de Mensagem
(
echo #!/bin/bash
echo npx commitlint --edit "$1" ^|^| {
echo   echo -e "\n\033[0;31m❌ ERRO: Mensagem de commit fora do padrao Warj-Group!\033[0m"
echo   echo "PADRAO: {tipo}/{id_yt}: Descricao"
echo   exit 1
echo }
) > .husky\commit-msg

:: Hook de Branch + MarkdownLint
(
echo #!/bin/bash
echo BRANCH=$(git rev-parse --abbrev-ref HEAD^)
echo REGEX="^^(main^|sprint-[0-9]+^)$^|^^(feature^|hotfix^|release^)\/WARJ-[0-9]+-.+$"
echo if [[ ! $BRANCH =~ $REGEX ]]; then
echo   echo -e "\n\033[0;31m❌ ERRO: Nome da branch fora do padrao Warj-Group!\033[0m"
echo   exit 1
echo fi
echo npx markdownlint-cli "**/*.md" --ignore node_modules --ignore "API5BD2026*"
) > .husky\pre-commit

echo ========================================================
echo   SUCESSO! Documentacao blindada localmente.
echo ========================================================
pause