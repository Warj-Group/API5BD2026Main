@echo off
setlocal enabledelayedexpansion

SEPARATOR="========================================================"

echo "$SEPARATOR"
echo   WARJ-GROUP - Configurando Ambiente Main (Documentações)
echo "$SEPARATOR"

:: 1. Verificar npm
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERRO] npm nao encontrado. Por favor, instale o Node.js.
    pause
    exit /b 1
)

echo [1/4] Instalando dependencias do projeto...
call npm install

echo [2/4] Criando configuracao do Commitlint (Formato ESM)...
(
echo export default {
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

echo [3/4] Inicializando Husky...
call npm exec husky init

echo [4/4] Configurando Hooks de seguranca...

:: Hook de Mensagem
(
echo #!/bin/bash
echo npx commitlint --edit "$1" ^|^| {
echo   echo -e "\n\033[0;31mXXXX ERRO: Mensagem de commit fora do padrao Warj-Group!\033[0m"
echo   echo "----------------------------------------------------------------"
echo   echo "PADRAO: {tipo}/{id_yt}: Descricao"
echo   echo "EXEMPLO: feat/WARJ-1: Inicializado repositorio frontend"
echo   echo ""
echo   echo "TIPOS ACEITOS: feat, fix, doc, style, refactor, test, chore, ci"
echo   echo "ID YOUTRACK: WARJ-X (onde X e o numero da tarefa)"
echo   echo "----------------------------------------------------------------"
echo   exit 1
echo }
) > .husky\commit-msg

:: Hook de Branch (Sem checagem de Markdown aqui)
(
echo #!/bin/bash
echo BRANCH=$(git rev-parse --abbrev-ref HEAD^)
echo REGEX="^^(main^|sprint-[0-9]+^)$^|^^(feature^|hotfix^|release^)\/WARJ-[0-9]+-.+$"
echo.
echo if [[ ! $BRANCH =~ $REGEX ]]; then
echo   echo -e "\n\033[0;31mXXXX ERRO: Nome da branch fora do padrao Warj-Group!\033[0m"
echo   echo "PADRAO: {feature|hotfix|release}/WARJ-X-Descricao"
echo   echo "EXEMPLO: feature/WARJ-1-setup-nuxt"
echo   echo ""
echo   exit 1
echo fi
) > .husky\pre-commit

echo "$SEPARATOR"
echo   SUCESSO! Padroes aplicados no Main.
echo "$SEPARATOR"
pause