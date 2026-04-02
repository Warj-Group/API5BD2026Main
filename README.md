# API5BD2026Main

Main API Repository 5th Semester Fatec Technological University - São José dos Campos/SP

Adicionado submodulos, necessário criar a documentação.

# Guia de Documentação - Repositório Main

Este repositório centraliza a documentação técnica e o gerenciamento de submodules da **Warj-Group**.

## Requisitos
- Node.js (v20+)
- npm ou pnpm

## Instalação Rápida
Para ativar as travas de commit e o linter de markdown, execute:
- **Windows:** `setup_main.bat`
- **Linux/Mac:** `bash setup_main.sh`

## 📏 Regras de Contribuição
1. **Mensagens de Commit:** Devem seguir o padrão `tipo/WARJ-X: Descrição`.
2. **Nomes de Branch:** Devem seguir o padrão `feature/WARJ-X-Descricao`.
3. **Qualidade do Markdown:** O Husky impedirá commits se os arquivos `.md` tiverem erros estruturais graves.

> **Dica:** Se o linter acusar erro, você pode verificar os detalhes rodando:
> `npx markdownlint-cli "**/*.md"`
