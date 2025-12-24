# IRISFHIRServerLogs
IRIS FHIRServer repository and FHIR foundation Logs
# IRIS FHIRServer Logs Viewer

This is a **CSP-based application** for viewing logs related to the **InterSystems IRIS FHIRServer Repository** and **FHIR Foundation** components.

The viewer provides a web-based interface to monitor and inspect server-side activity, making it easier to debug and audit FHIR server operations.

## 🔍 Features

- View FHIRServer repository logs
- View FHIR Foundation logs
- Simple, browser-based interface via CSP
- Built on InterSystems IRIS
- Dockerized for easy deployment

## 🚀 How to Run

Ensure you have [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.

Then, in the root of the repository, run:

```bash
docker compose -f 'docker-compose.yml' up -d --build
```
---

http://localhost:52773/csp/user/HSFiles.Logs.cls

<img width="1918" height="862" alt="image" src="https://github.com/user-attachments/assets/cc592e3d-1795-42e3-8b9b-bd8c02098847" />


