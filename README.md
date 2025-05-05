# 📦 Ambiente Integrado: n8n + PostgreSQL + Redis + Evolution API (WhatsApp)

Este repositório configura um ambiente completo para automação de processos com **n8n**, persistência com **PostgreSQL**, cache com **Redis**, e envio/recebimento de mensagens via **Evolution API (WhatsApp)**.

A infraestrutura foi organizada com `docker-compose`, utilizando `network_mode: host` para facilitar a comunicação direta entre os serviços.

---

## 🧱 Serviços Inclusos

### 🔄 n8n
Plataforma de automação de workflows com suporte a múltiplas integrações, APIs e lógica personalizada.

- Imagem: `n8nio/n8n:latest`
- Armazenamento de dados em volume dedicado
- Variáveis de ambiente carregadas de `./n8n/.env`

### 🗄️ PostgreSQL
Banco de dados relacional robusto para persistência dos dados da automação.

- Imagem: `postgres:14`
- Volume dedicado para persistência dos dados
- Configuração via `./postgres/.env`

### ⚡ Redis
Armazenamento em memória, utilizado para cache e melhora de performance em determinadas operações.

- Imagem: `redis:latest`
- Porta exposta: `6379`

### 📲 Evolution API (WhatsApp)
API de comunicação com WhatsApp, mantida pela AtendAI (fork do Venom Bot).

- Imagem: `atendai/evolution-api:v2.1.1`
- Porta exposta: `8080`
- Volumes montados para persistência de sessões
- Variáveis de ambiente em `./evolution-api/.env`

---

## 🚀 Instruções para Inicialização

1. **Clone o repositório:**

   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio

2. **Crie ou edite os arquivos .env conforme necessário:**
- ./postgres/.env
- ./n8n/.env
- ./evolution-api/.env
  
3. **Suba os containers:**
Certifique-se de que nenhuma das portas utilizadas (5432, 6379, 5678, 8080) esteja em uso.

   ```bash
   docker-compose up -d

4. **Acesse os serviços:**
- n8n: http://localhost:5678
- Evolution API: http://localhost:8080

---

## 🛠️ Requisitos
- Docker
- Docker Compose
- Sistema operacional Linux/Windows 
