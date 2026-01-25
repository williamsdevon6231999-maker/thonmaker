# OpenVAS – DAST Configuration

This directory contains the OpenVAS deployment used for Dynamic Application
Security Testing (DAST) against the Thonmaker application.

## Deployment
OpenVAS is deployed using Docker Compose on a dedicated scanner host.

## Scan Target
- Azure App Service public URL
- HTTPS endpoint of the running container

## Execution
OpenVAS scans are executed post-deployment to identify:
- Network vulnerabilities
- Exposed services
- Known CVEs at runtime

## CI/CD Integration Model
- SAST (Semgrep): blocks insecure code
- Image Scan (Trivy): blocks vulnerable containers
- DAST (OpenVAS): validates runtime exposure

## Severity Handling
- High or Critical findings require remediation
- Results are reviewed and tracked as security findings

## Compliance Mapping
Supports CMMC Level 2 (NIST SP 800-171):
- RA.L2-3.11.2 – Vulnerability scanning
- RA.L2-3.11.3 – Risk remediation
- SI.L2-3.14.1 – System monitoring
