# 🔐 Secure DevSecOps CI/CD Pipeline

A security-focused CI/CD pipeline for a containerized web application.

## 📌 Project Overview

This project demonstrates how DevSecOps practices can be integrated
into the software development and deployment lifecycle.

The pipeline automatically performs application testing, static
security analysis, secret detection, and container vulnerability
scanning before the application can proceed toward deployment.

## 🎯 Objectives

- Integrate security into the CI/CD lifecycle
- Detect insecure source-code patterns
- Detect accidentally committed secrets
- Scan Docker images for vulnerabilities
- Containerize the application securely
- Deploy the application to AWS
- Apply AWS IAM least-privilege principles
- Implement secure CI/CD authentication

## 🛠️ Technology Stack

### Application

- Python
- Flask

### Version Control

- Git
- GitHub

### CI/CD

- GitHub Actions

### Security

- Semgrep
- Gitleaks
- Trivy

### Containerization

- Docker
- Docker Compose

### Cloud

- AWS EC2
- Amazon ECR
- AWS IAM

## 🔄 CI/CD Workflow

```text
Developer
    |
    v
  GitHub
    |
    v
GitHub Actions
    |
    +----> Application Tests
    |
    +----> Semgrep SAST
    |
    +----> Gitleaks Secret Scan
    |
    +----> Trivy Container Scan
    |
    v
Security Gate
    |
    +-------- FAIL --------> STOP
    |
    +-------- PASS --------> Docker Build
                                  |
                                  v
                              AWS ECR
                                  |
                                  v
                              AWS EC2
                                  |
                                  v
                            Application