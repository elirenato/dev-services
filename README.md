# Repository with common Docker images required for development purpose

## Current images available

- PostgreSQL for relational database.
- Keycloak to add authentication to applications.

## How to use this project

1. Clone this repository.

2. Duplicate the .env.example to .env of the desired service and change the .env.

4. Build the images with `./dev-services.sh {profile} build`. 

5. Start the containers with `./dev-services.sh {profile} up -d`.

**Example to use Keycloak**:

- To build the image:
```
cp docker-compose\keycloak\.env.example docker-compose\keycloak\.env
./dev-services.sh keycloak build
```

- To start the container(s):
```
./dev-services.sh keycloak up -d
```

Where `-d` is to run the container in background.

- To stop the container(s):
```
./dev-services.sh keycloak down
```

PS: These images are for development purpose only.

## Reference

- [Getting start with Keycloak on Docker](https://www.keycloak.org/getting-started/getting-started-docker).
- [PostgreSQL on Docker](https://hub.docker.com/_/postgres).