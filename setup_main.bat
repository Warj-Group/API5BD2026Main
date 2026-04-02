@echo off
echo ========================================================
echo   WARJ-GROUP - Configurando Ambiente DOCUMENTAÇÃO (MAIN)
echo ======================================================== 

:: Verifica Node/npm
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERRO] npm nao encontrado. [cite: 8]
    pause
    exit /b 1
)

echo [1/4] Instalando dependencias de Lint e Git Hooks...
call npm init -y
call npm install --save-dev husky @commitlint/cli @commitlint/config-conventional markdownlint-cli

echo [2/4] Inicializando Husky...
call npm exec husky init

echo [3/4] Configurando Hook de Mensagem (commit-msg)...
(
echo #!/bin/bash
echo.
echo # Roda o linter. Se falhar, exibe o guia de uso da Warj-Group
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

echo [4/4] Configurando Hook de Branch (pre-commit)...
(
echo #!/bin/bash
echo.
echo # Valida o nome da branch atual
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

echo ========================================================
echo   SUCESSO! Padroes Warj-Group aplicados localmente.
echo ========================================================
pause
pause