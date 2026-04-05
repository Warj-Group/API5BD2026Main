#!/bin/bash

SEPARATOR="========================================================"

echo "$SEPARATOR"
echo "  WARJ-GROUP - Configurando Ambiente Main (Documentações)"
echo "$SEPARATOR"

# 1. Verificar npm
if ! command -v npm &> /dev/null; then
    echo "ERRO: npm não encontrado."
    exit 1
fi

echo "[1/4] Instalando dependências..."
npm install --ignore-scripts

echo "[2/4] Criando commitlint.config.js (Formato ESM)..."
cat << 'EOF' > commitlint.config.js
export default {
  parserPreset: {
    parserOpts: {
      headerPattern: /^(feat|fix|doc|style|refactor|test|chore|ci)\/(WARJ-\d+|main|sprint-\d+): (.+)$/,
      headerCorrespondence: ['type', 'scope', 'subject']
    }
  },
  rules: {
    'type-empty': [2, 'never'],
    'subject-empty': [2, 'never'],
    'type-enum': [2, 'always', ['feat', 'fix', 'doc', 'style', 'refactor', 'test', 'chore', 'ci']]
  }
};
EOF

echo "[3/4] Inicializando Husky..."
npx husky init

echo "[4/4] Configurando Hooks do Husky..."

# Hook de Mensagem
cat << 'EOF' > .husky/commit-msg
#!/bin/bash
npx commitlint --edit "$1" || {
  echo -e "\n\033[0;31m ERRO: Mensagem de commit fora do padrão Warj-Group!\033[0m"
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

# Hook de Branch
cat << 'EOF' > .husky/pre-commit
#!/bin/bash
BRANCH=$(git rev-parse --abbrev-ref HEAD)
REGEX="^(main|sprint-[0-9]+)$|^(feature|hotfix|release)\/WARJ-[0-9]+-.+$"

if [[ ! $BRANCH =~ $REGEX ]]; then
  echo -e "\n\033[0;31m ERRO: Nome da branch fora do padrão Warj-Group!\033[0m"
  echo "PADRÃO: {feature|hotfix|release}/WARJ-X-Descrição"
  echo "EXEMPLO: feature/WARJ-1-setup-nuxt"
  echo ""
  exit 1
fi
EOF

chmod +x .husky/commit-msg
chmod +x .husky/pre-commit

echo "$SEPARATOR"
echo "  ✅ SUCESSO! Ambiente main configurado."
echo "$SEPARATOR"