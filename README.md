# 🔐 Secure DevSecOps CI/CD Pipeline

A security-focused CI/CD pipeline for a containerized Flask web application.

This project demonstrates how security can be integrated into the complete software delivery lifecycle, from source-code testing to container vulnerability scanning and container registry publishing.

---

## 📌 Project Overview

The pipeline automatically performs:

- Application testing
- Static Application Security Testing (SAST)
- Secret detection
- Docker image building
- Container vulnerability scanning
- Secure container registry publishing
- Application health verification

Security checks are executed before the Docker image is published.

---

## 🎯 Objectives

- Integrate security into the CI/CD lifecycle
- Detect insecure source-code patterns
- Detect accidentally committed secrets
- Scan Docker images for vulnerabilities
- Build a hardened container image
- Publish verified images to GitHub Container Registry
- Prepare the application for cloud deployment
- Apply least-privilege security principles
- Implement secure CI/CD authentication

---

## 🛠️ Technology Stack

### Application

- Python 3.12
- Flask
- Gunicorn

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

### Container Registry

- GitHub Container Registry (GHCR)

### Cloud

- AWS

---

## 🔄 DevSecOps Pipeline

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
    +----> Gitleaks Secret Detection
    |
    v
Docker Build
    |
    v
Trivy Vulnerability Scan
    |
    +-------- FAIL --------> STOP
    |
    +-------- PASS --------> GHCR
                                  |
                                  v
                           Verified Container
                                  |
                                  v
                            Cloud Deployment