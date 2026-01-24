# Thonmaker – Azure DevSecOps CI/CD (Docker → ACR → App Service) + CMMC Level 2 Mapping

Thonmaker is a containerized web application deployed through an end-to-end **Azure DevOps CI/CD pipeline**. This repo is built as a **portfolio-grade DevSecOps project** that demonstrates secure software delivery using **Docker**, **Azure Container Registry (ACR)**, **Azure App Service (Web App for Containers)**, and security scans (**Semgrep SAST** + **Trivy image scanning**), with **Managed Identity** and **RBAC** for registry access.

 Successful deployment validation page: **“Thonmaker Docker CI/CD working!”**

---

## What This Project Demonstrates

- Automated CI/CD with Azure DevOps Pipelines
- Docker image build and repeatable deployments
- Static Application Security Testing (SAST) with **Semgrep**
- Container vulnerability scanning with **Trivy**
- Private image storage in **ACR**
- Secure image pulls by App Service using **System-Assigned Managed Identity** + **AcrPull**
- Auditable build/deploy logs suitable for compliance evidence

---

## Architecture Overview

**Flow:**
1. Developer pushes code to `main`
2. Azure DevOps Pipeline runs
3. Semgrep scans source code (SAST)
4. Docker image is built and tagged with `$(Build.BuildId)`
5. Trivy scans the built image for CVEs
6. Image is pushed to ACR
7. App Service pulls the image from ACR using Managed Identity
8. App Service restarts container and serves the app

---

## Technologies Used

- **Azure DevOps Pipelines** – CI/CD automation
- **Self-hosted Windows build agent** – pipeline execution environment
- **Docker** – container build and packaging
- **Semgrep** – SAST (static code scanning)
- **Trivy** – container vulnerability scanning (CVEs)
- **Azure Container Registry (ACR)** – private image registry
- **Azure App Service (Linux Container)** – container hosting
- **Managed Identity + RBAC** – secure, passwordless ACR image pulls
- **Git** – version control

---

## Local Development

### Build the image locally
```bash
docker build -t thonmaker:local .
