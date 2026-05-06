# Secure App CI/CD Demo

This repository demonstrates an advanced DevSecOps pipeline utilizing GitHub Actions. 

## Pipeline Architecture
1. **Code & Secret Scanning:** Validates code quality and prevents credential leakage.
2. **Dependency Audit:** Analyzes `requirements.txt` for vulnerable packages.
3. **Build, Scan & Attest:** Builds a local container, scans it for OS vulnerabilities, generates a Software Bill of Materials (SBOM), and outputs an attestation file marking the specific Git SHA as a trusted build.
