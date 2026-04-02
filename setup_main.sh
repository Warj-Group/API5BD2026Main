#!/bin/bash

echo "========================================================"
echo "  WARJ-GROUP - Configurando Ambiente Frontend"
echo "========================================================"

# 1. Verificar pnpm
if ! command -v pnpm &> /dev/null; then
    echo "❌ ERRO: pnpm não encontrado. Por favor, instale o pnpm."
    exit 1
fi

echo "📦 [1/4] Instalando dependências..."
pnpm install

echo "🐶 [2/4] Inicializando Husky..."
pnpm exec husky init

echo "📝 [3/4] Configurando commit-msg hook..."
cat << 'EOF' > .husky/commit-msg
#!/bin/bash

# Roda o linter. Se falhar, exibe o guia de uso da Warj-Group
npx commitlint --edit "$1" || {
  echo -e "\n\033[0;31m❌ ERRO: Mensagem de commit fora do padrão Warj-Group!\033[0m"
  echo "----------------------------------------------------------------"
  echo "PADRÃO: {tipo}/{id_yt}: Descrição"
  echo "EXEMPLO: feat/WARJ-1: Inicializado repositório frontend"
  echo ""
  echo "TIPOS ACEITOS: feat, fix, doc, style, refactor, test, chore, ci"
  echo "ID YOUTRACK: WARJ-X (onde X é o número da tarefa)"
  echo "----------------------------------------------------------------"
  exit 1
}
EOF

echo "🌿 [4/4] Configurando pre-commit hook..."
cat << 'EOF' > .husky/pre-commit
#!/bin/bash

# Valida o nome da branch atual
BRANCH=$(git rev-parse --abbrev-ref HEAD)
REGEX="^(main|sprint-[0-9]+)$|^(feature|hotfix|release)\/WARJ-[0-9]+-.+$"

if [[ ! $BRANCH =~ $REGEX ]]; then
  echo -e "\n\033[0;31m❌ ERRO: Nome da branch fora do padrão Warj-Group!\033[0m"
  echo "PADRÃO: {feature|hotfix|release}/WARJ-X-Descrição"
  echo "EXEMPLO: feature/WARJ-1-setup-nuxt"
  echo ""
  exit 1
fi
EOF

# Garante permissões de execução
chmod +x .husky/commit-msg
chmod +x .husky/pre-commit

echo "========================================================"
echo "  ✅ SUCESSO! Padrões Warj-Group aplicados."
echo "========================================================"