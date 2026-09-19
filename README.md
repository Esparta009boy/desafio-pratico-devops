# 🚀 Desafio Prático DevOps / DevSecOps

Este repositório contém o projeto e a implementação de uma esteira completa de CI/CD com foco em **DevSecOps**, desenvolvida como parte de uma atividade prática da minha formação em **DevOps**.

---

## 📌 Contexto e Motivação

Devido a restrições e limitações de ambiente local (como a ausência de recursos locais como Docker e LocalStack na máquina de desenvolvimento), toda a automação, testes, validações de infraestrutura como código (IaC) e build de contêineres foram projetados para serem executados de forma remota, segura e automatizada por meio de **GitHub Actions Runners**.

Essa abordagem garante consistência no processo de integração e entrega contínua, independentemente do ambiente local do desenvolvedor.

---

## 🛠️ Tecnologias e Ferramentas Utilizadas

- **Linguagem / Runtime:** Node.js (JavaScript)
- **Testes:** Jest
- **Conteinerização:** Docker / Docker Compose
- **Infraestrutura como Código (IaC):** Terraform
- **Segurança & DevSecOps:**
  - **Gitleaks:** Verificação e detecção de secrets/credenciais expostas no código.
  - **Checkov:** Análise estática de segurança e conformidade para arquivos Terraform (IaC).
  - **Trivy:** Análise de vulnerabilidades em imagens Docker.
- **CI/CD & Registry:** GitHub Actions & GitHub Container Registry (GHCR)

---

## 🔄 Fluxo da Pipeline (GitHub Actions)

A esteira de CI/CD (`pipeline.yml`) foi configurada para disparar a cada `push` no repositório, executando as seguintes etapas em sequência:

1. **Secret Scan (Gitleaks):** Analisa o repositório em busca de chaves, senhas ou tokens expostos.
2. **Testes Unitários (Jest):** Executa os testes automatizados da aplicação para garantir a qualidade do código.
3. **IaC Scan (Checkov):** Avalia os arquivos da pasta `terraform/` em busca de más práticas e falhas de segurança na infraestrutura.
4. **Build e Scan Docker (Trivy):** Constrói a imagem Docker da aplicação e realiza a varredura em busca de vulnerabilidades de segurança.
5. **Publicar Imagem no GHCR:** Ao ser aprovada em todas as verificações, a imagem do contêiner é publicada no GitHub Container Registry.

---

## 📂 Estrutura do Repositório

```text
.
├── .github/
│   └── workflows/
│       └── pipeline.yml       # Definição do pipeline de CI/CD
├── src/                       # Código-fonte da aplicação Node.js
├── terraform/                 # Arquivos de Infraestrutura como Código (IaC)
├── tests/                     # Testes unitários com Jest
├── .env.example               # Exemplo de variáveis de ambiente
├── Dockerfile                 # Configuração para criação do contêiner
├── docker-compose.yml         # Orquestração local/multicontêiner
├── jest.config.js             # Configuração do Jest
└── package.json               # Dependências do projeto
