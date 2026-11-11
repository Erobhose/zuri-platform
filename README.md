# zuri-platform
Devops platform infrastructure and CI/CD for Zuri Market
# Zuri Market — DevOps Capstone

## Project Overview

Zuri Market is an e-commerce application demonstrating DevOps and platform engineering practices, including containerization, infrastructure as code, CI/CD, cloud deployment, security, and monitoring.

## Repositories

- [Platform and Infrastructure](https://github.com/Erobhose/zuri-platform)
- [Backend](https://github.com/Erobhose/zuriapp-backend)
- [Frontend](https://github.com/Erobhose/zuriapp-frontend)

## Technology Stack

- **Application:** React, Vite, Node.js, Express
- **Containers:** Docker and Docker Compose
- **Infrastructure:** Terraform and AWS
- **Orchestration:** Kubernetes
- **CI/CD:** GitHub Actions
- **Security:** SonarQube and Trivy
- **Monitoring:** Prometheus and Grafana
- **Secrets:** AWS Secrets Manager

## Architecture

The frontend communicates with the backend API through Kubernetes services and Ingress. Terraform provisions AWS infrastructure, while GitHub Actions tests the application, analyzes code quality, scans container images, and publishes images to Docker Hub. Prometheus and Grafana provide monitoring.

## Run Locally

From the `zuri-platform` directory, run:

```bash
docker compose -f docker-compose.yaml up --build
```

Access the application:

- Frontend: http://localhost:8080
- Backend API: http://localhost:5000/api/products

Stop the application:

```bash
docker compose -f docker-compose.yaml down
```

## Infrastructure and Deployment

Terraform configuration is located in `terraform/`, with reusable modules and separate development and production environments.

Kubernetes manifests are located in `k8s/` and define the frontend, backend, services, Ingress, and monitoring components.

Initialize and validate Terraform from the appropriate environment directory:

```bash
terraform init
terraform validate
terraform plan
```

Review the plan before applying any infrastructure changes.

## CI/CD and Security

The GitHub Actions workflow is located at `.github/workflows/ci-cd.yml`. It automates application testing, frontend builds, code-quality analysis, container image scanning, and image publishing.

Configure required credentials using GitHub repository secrets. Never commit passwords, tokens, or other sensitive values.

## Monitoring and Automation

Prometheus and Grafana are used to monitor application health and performance. The project also requires a Bash health-check script, timestamped reports, and a daily cron schedule.

Verify that the monitoring panels and health-check automation are operational before submission.

## Evidence and Verification

Submission evidence should include:

- Protected branches and pull requests
- Successful CI/CD runs
- Terraform and AWS infrastructure
- Published container images
- Kubernetes deployment status
- SonarQube and Trivy results
- Grafana dashboards
- Health-check reports
- Architecture diagram

## Project Links

- [GitHub Actions](https://github.com/Erobhose/zuri-platform/actions)
- [Platform Pull Requests](https://github.com/Erobhose/zuri-platform/pulls)
- [Backend Docker Hub Image](https://hub.docker.com/r/erobhose/zuriapp-backend)
- [Frontend Docker Hub Image](https://hub.docker.com/r/erobhose/zuriapp-frontend)

**Note:** Verify that all required components and evidence are present before final submission. Argo CD is an optional extension.