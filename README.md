# Secure DevSecOps Pipeline

![Secure DevSecOps Pipeline](Secure%20DevSecOps%20Pipeline.png)

## Project Description

This project demonstrates a Secure DevSecOps CI/CD pipeline using GitHub Actions, Docker, Semgrep, GitLeaks, and Trivy.

The pipeline automatically tests the application and performs security checks whenever code is pushed to the repository.

## Pipeline Workflow

Developer Push → GitHub Actions → Application Tests → Semgrep SAST Scan → GitLeaks Secret Detection → Docker Image Build → Trivy Vulnerability Scan → Pipeline Success

## Tools Used

- **GitHub Actions** – CI/CD automation
- **Python & Flask** – Application development
- **Docker** – Containerization
- **Semgrep** – Static Application Security Testing (SAST)
- **GitLeaks** – Secret detection
- **Trivy** – Docker image vulnerability scanning

## Project Structure

```text
secure-devsecops-pipeline/
│
├── .github/
│   └── workflows/
│       └── security-pipeline.yml
│
├── app/
├── security/
├── tests/
│
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── requirements-dev.txt
└── README.md
