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

## Regras de Escrita
1. [cite_start]**Padrão de Commit:** `{tipo}/{id_yt}: Descrição`[cite: 1, 4].
2. [cite_start]**Padrão de Branch:** `{feature|hotfix|release}/WARJ-X-Descricao`[cite: 7].
3. **Markdown:** O commit será bloqueado se houver erros graves de sintaxe no Markdown. Você pode rodar a verificação manualmente com:
   `npx markdownlint "**/*.md"`
