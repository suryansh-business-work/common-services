# common-services

A collection of common infrastructure services running in Docker containers, auto-deployed via GitHub Actions.

## Services

| Sr. No. | Service                | Port | Internal Port | Description                      |
|---------|------------------------|------|---------------|----------------------------------|
| 1       | SonarQube              | 4014 | 9000          | Code quality & security analysis |
| 2       | Grafana                | 4015 | 3000          | Monitoring dashboards            |
| 3       | Prometheus             | 4016 | 9090          | Metrics collection               |
| 4       | MongoDB                | 4017 | 27017         | NoSQL database                   |
| 5       | Loki                   | 4018 | 3100          | Log aggregation                  |
| 6       | Vault                  | 4019 | 8200          | Secrets management               |
| 7       | PostgreSQL             | 4020 | 5432          | Relational database              |
| 8       | Redis                  | 4021 | 6379          | In-memory cache/store            |
| 9       | tusd                   | 4022 | 8080          | Resumable file uploads           |
| 10      | MinIO Console          | 4030 | 9001          | Object storage console           |
| 11      | MinIO API              | 4031 | 9000          | Object storage API               |
| 12      | GitHub Custom Runner   | 4033 | 4033          | Self-hosted CI/CD runner         |

## Project Structure

```
common-services/
├── .github/workflows/deploy.yml    # CI/CD pipeline
├── sonarqube/Dockerfile
├── grafana/Dockerfile
├── prometheus/
│   ├── Dockerfile
│   └── prometheus.yml
├── loki/
│   ├── Dockerfile
│   └── loki-config.yml
├── vault/Dockerfile
├── tusd/Dockerfile
├── minio-console/Dockerfile
├── mongodb/Dockerfile
├── postgresql/Dockerfile
├── redis/Dockerfile
├── github-custom-runner/
│   ├── Dockerfile
│   └── start.sh
├── docker-compose.yml
├── .env.example
└── README.md
```

## Prerequisites

- Docker & Docker Compose installed on the server
- GitHub account with repository access
- Docker Hub account

## GitHub Actions Secrets Required

Add the following secrets in your GitHub repository settings (`Settings > Secrets and variables > Actions`):

| Secret              | Description                                |
|---------------------|--------------------------------------------|
| `SSH_KEY`           | Private SSH key for server access          |
| `SSH_USER`          | SSH username for the server                |
| `SSH_HOST`          | Server hostname or IP address              |
| `SSH_PORT`          | SSH port (usually 22)                      |
| `DOCKERHUB_USERNAME`| Docker Hub username                       |
| `DOCKERHUB_TOKEN`  | Docker Hub access token                    |

## Deployment

### Automatic (via GitHub Actions)

Simply push to the `main` branch. GitHub Actions will:

1. Build all 11 service Docker images in parallel
2. Push images to Docker Hub
3. SSH into your server
4. Pull latest images
5. Restart all containers with `docker compose`

### Manual (Local)

```bash
# Clone the repository
git clone https://github.com/suryansh-business-work/common-services.git
cd common-services

# Copy and configure environment variables
cp .env.example .env
# Edit .env with your values

# Build and start all services
docker compose up -d --build

# Check status
docker compose ps

# View logs
docker compose logs -f [service-name]

# Stop all services
docker compose down
```

## Default Credentials

| Service    | Username     | Password     |
|------------|-------------|--------------|
| Grafana    | admin       | admin        |
| MongoDB    | admin       | admin        |
| PostgreSQL | admin       | admin        |
| MinIO      | minioadmin  | minioadmin   |
| Vault      | Token: root | -            |
| SonarQube  | admin       | admin        |

> **Warning**: Change all default credentials in production by updating the `.env` file.

## Access URLs

After deployment, access services at:

- **SonarQube**: http://your-server:4014
- **Grafana**: http://your-server:4015
- **Prometheus**: http://your-server:4016
- **MongoDB**: mongodb://your-server:4017
- **Loki**: http://your-server:4018
- **Vault**: http://your-server:4019
- **PostgreSQL**: postgresql://your-server:4020
- **Redis**: redis://your-server:4021
- **tusd**: http://your-server:4022
- **MinIO Console**: http://your-server:4030
- **MinIO API**: http://your-server:4031

## License

MIT
