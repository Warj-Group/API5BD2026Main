@echo off
setlocal enabledelayedexpansion

echo ========================================================
echo   WARJ-GROUP - Configurando Ambiente DOCUMENTACAO (MAIN)
echo ========================================================

:: 1. Verificar npm
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERRO] npm nao encontrado. Por favor, instale o Node.js.
    pause
    exit /b 1
)

echo [1/5] Instalando dependencias (Lint + Husky)...
call npm init -y
call npm install --save-dev husky @commitlint/cli @commitlint/config-conventional markdownlint-cli

echo [2/5] Criando configuracao do Commitlint...
(
echo module.exports = {
echo   parserPreset: {
echo     parserOpts: {
echo       headerPattern: /^^(feat^|fix^|doc^|style^|refactor^|test^|chore^|ci^)\/(WARJ-\d+^|main^|sprint-\d+^): (.+^)$/,
echo       headerCorrespondence: ['type', 'scope', 'subject']
echo     }
echo   },
echo   rules: {
echo     'type-empty': [2, 'never'],
echo     'subject-empty': [2, 'never'],
echo     'type-enum': [2, 'always', ['feat', 'fix', 'doc', 'style', 'refactor', 'test', 'chore', 'ci']]
echo   }
echo };
) > commitlint.config.js

echo [3/5] Criando configuracao do Markdownlint...
(
echo {
echo   "default": true,
echo   "MD013": false,
echo   "MD033": false,
echo   "MD034": false
echo }
) > .markdownlint.json

echo [4/5] Inicializando Husky...
call npm exec husky init

echo [5/5] Configurando Hooks de seguranca...

:: Hook de Mensagem
(
echo #!/bin/bash
echo npx commitlint --edit "$1" ^|^| {
echo   echo -e "\n\033[0;31m❌ ERRO: Mensagem de commit fora do padrao Warj-Group!\033[0m"
echo   echo "----------------------------------------------------------------"
echo   echo "PADRAO: {tipo}/{id_yt}: Descricao"
echo   echo "EXEMPLO: feat/WARJ-1: Descricao"
echo   echo "----------------------------------------------------------------"
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
echo   echo "PADRAO: {feature^|hotfix^|release^}/WARJ-X-Descricao"
echo   exit 1
echo fi
echo echo "📝 Checando formatacao dos arquivos Markdown..."
echo npx markdownlint-cli "**/*.md" --ignore node_modules --ignore "API5BD2026*"
) > .husky\pre-commit

echo ========================================================
echo   SUCESSO! Padroes aplicados e commitlint.config.js criado.
echo ========================================================
pause