#!/bin/bash

echo "========================================================"
echo "  WARJ-GROUP - Configurando Ambiente DOCUMENTACAO (MAIN)"
echo "========================================================"

# 1. Verificar npm
if ! command -v npm &> /dev/null; then
    echo "ERRO: npm não encontrado."
    exit 1
fi

echo "[1/5] Instalando dependências..."
npm init -y
npm install --save-dev husky @commitlint/cli @commitlint/config-conventional markdownlint-cli
npm install -g markdown-link-check

echo "[2/5] Criando commitlint.config.js..."
cat << 'EOF' > commitlint.config.js
module.exports = {
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

echo "[3/5] Criando .markdownlint.json..."
cat << 'EOF' > .markdownlint.json
{
  "default": true,
  "MD013": false,
  "MD033": false,
  "MD034": false
}
EOF

echo "[4/5] Inicializando Husky..."
npx husky init

echo "[5/5] Configurando Hooks do Husky..."

# Hook de Mensagem
cat << 'EOF' > .husky/commit-msg
#!/bin/bash
npx commitlint --edit "$1" || {
  echo -e "\n\033[0;31m ERRO: Mensagem de commit fora do padrão Warj-Group!\033[0m"
  echo "----------------------------------------------------------------"
  echo "PADRÃO: {tipo}/{id_yt}: Descrição"
  echo "EXEMPLO: doc/WARJ-1: Atualizado README principal"
  echo ""
  echo "TIPOS ACEITOS: feat, fix, doc, style, refactor, test, chore, ci"
  echo "ID YOUTRACK: WARJ-X (onde X é o número da tarefa)"
  echo "----------------------------------------------------------------"
  exit 1
}
EOF

# Hook de Branch + MarkdownLint
cat << 'EOF' > .husky/pre-commit
#!/bin/bash
BRANCH=$(git rev-parse --abbrev-ref HEAD)
REGEX="^(main|sprint-[0-9]+)$|^(feature|hotfix|release)\/WARJ-[0-9]+-.+$"

if [[ ! $BRANCH =~ $REGEX ]]; then
  echo -e "\n\033[0;31m ERRO: Nome da branch fora do padrão Warj-Group!\033[0m"
  echo "PADRÃO: {feature|hotfix|release}/WARJ-X-Descrição"
  echo "EXEMPLO: feature/WARJ-1-setup-docs"
  echo ""
  exit 1
fi

echo "Checando formatação dos arquivos Markdown..."
npx markdownlint-cli "**/*.md" --ignore node_modules --ignore "API5BD2026*"
EOF

chmod +x .husky/commit-msg
chmod +x .husky/pre-commit

echo "========================================================"
echo "  ✅ SUCESSO! Ambiente configurado com Commitlint e Lint."
echo "========================================================"