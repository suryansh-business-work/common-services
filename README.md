# infra-stack

Production-ready DevOps infrastructure — 13 services via a single Docker Compose file, auto-deployed on push via GitHub Actions.

## Services

| #  | Service              | Port | Image                                | Source                                                                 |
|----|----------------------|------|--------------------------------------|------------------------------------------------------------------------|
| 1  | SonarQube            | 4014 | `sonarqube:lts-community`            | [SonarSource/sonarqube](https://github.com/SonarSource/sonarqube)      |
| 2  | Grafana              | 4015 | `grafana/grafana-oss:latest`         | [grafana/grafana](https://github.com/grafana/grafana)                  |
| 3  | Prometheus           | 4016 | `prom/prometheus:latest`             | [prometheus/prometheus](https://github.com/prometheus/prometheus)       |
| 4  | MongoDB              | 4017 | `mongo:latest`                       | [mongodb/mongo](https://github.com/mongodb/mongo)                      |
| 5  | Loki                 | 4018 | `grafana/loki:latest`                | [grafana/loki](https://github.com/grafana/loki)                        |
| 6  | Vault                | 4019 | `hashicorp/vault:latest`             | [hashicorp/vault](https://github.com/hashicorp/vault)                  |
| 7  | PostgreSQL           | 4020 | `postgres:latest`                    | [postgres/postgres](https://github.com/postgres/postgres)              |
| 8  | Redis                | 4021 | `redis:latest`                       | [redis/redis](https://github.com/redis/redis)                          |
| 9  | tusd                 | 4022 | `tusproject/tusd:latest`             | [tus/tusd](https://github.com/tus/tusd)                                |
| 10 | MinIO Console        | 4030 | `minio/minio:latest`                 | [minio/console](https://github.com/minio/console)                      |
| 11 | GitHub Runner        | 4033 | `myoung34/github-runner:latest`      | [Self-Hosted Runners](https://docs.github.com/en/actions/hosting-your-own-runners) |
| 12 | n8n                  | 4034 | `n8nio/n8n:latest`                   | [n8n-io/n8n](https://github.com/n8n-io/n8n)                            |
| 13 | RedisInsight         | 4035 | `redis/redisinsight:latest`          | [redis/RedisInsight](https://github.com/redis/RedisInsight)             |

## Folder Structure

```
infra-stack/
├── compose/all.yml                 # Single Docker Compose file
├── .github/workflows/deploy.yml    # CI/CD — push to main triggers deploy
├── .env.example                    # Template for environment variables
├── .gitignore
└── README.md
```

## Quick Start

```bash
# 1. Clone
git clone https://github.com/suryansh-business-work/common-services.git infra-stack
cd infra-stack

# 2. Configure
cp .env.example .env
# Edit .env with your values

# 3. Start everything
docker compose -f compose/all.yml --env-file .env up -d

# 4. Check
docker compose -f compose/all.yml ps
```

## CI/CD — GitHub Actions

On every push to `main`, the workflow:

1. SSHs into your server
2. Runs `git pull` (or clones first time)
3. Pulls latest Docker images
4. Runs `docker compose up -d`

### Required GitHub Secrets

| Secret              | Description                 |
|---------------------|-----------------------------|
| `SSH_KEY`           | Private SSH key             |
| `SSH_USER`          | SSH username                |
| `SSH_HOST`          | Server IP / hostname        |
| `SSH_PORT`          | SSH port (default 22)       |

## Default Credentials

| Service    | User / Key       | Password       |
|------------|------------------|----------------|
| PostgreSQL | admin            | admin          |
| Grafana    | admin            | admin          |
| MongoDB    | admin            | admin          |
| MinIO      | minioadmin       | minioadmin     |
| Vault      | Token: `root`    | —              |
| SonarQube  | admin            | admin          |
| n8n        | admin            | admin          |

> **Change all defaults before deploying to production.**

## Useful Commands

```bash
# Logs for a specific service
docker compose -f compose/all.yml logs -f grafana

# Restart one service
docker compose -f compose/all.yml restart redis

# Stop everything
docker compose -f compose/all.yml down

# Stop + remove volumes (⚠️ data loss)
docker compose -f compose/all.yml down -v
```

## License

MIT
