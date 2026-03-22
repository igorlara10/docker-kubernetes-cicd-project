# 🚀 DevOps Cloud Project (Docker + Kubernetes + CI/CD + AWS + Terraform)

## 📌 Overview
Projeto prático de DevOps com foco em automação de infraestrutura, containerização e deploy em cloud.

## 🛠️ Tecnologias
- AWS (EC2)
- Terraform (Infrastructure as Code)
- Docker
- Kubernetes (local com Minikube)
- GitHub Actions (CI/CD)
- Linux

## ⚙️ O que foi implementado

✔ Containerização da aplicação com Docker  
✔ Orquestração local com Kubernetes  
✔ Pipeline CI com GitHub Actions  
✔ Provisionamento de infraestrutura na AWS com Terraform  
✔ Deploy automatizado de container em EC2  

## ☁️ Arquitetura

Usuário → EC2 (AWS) → Docker Container → Aplicação Web

## 🚀 Como executar

### Local (Docker)
```bash
docker build -t devops-app .
docker run -p 5000:5000 devops-app
