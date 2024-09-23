## General

The main goal of this repo is to compare MS SQL and PostgreSQL in terms of anomalies and, as a result, better understand the key differences between Locking-Based Concurrency Control and Multiversion Concurrency Control.

## How To Use

The docker compose provides both MS SQL and Postgres instances already prepared, so `docker-compose up` is the only thing you need to unwrap the playground. After this, use the following credentials to access your local databases:

- MS SQL
  - Host: `localhost:1401`
  - Database: `anomalies`
  - Username: `test`
  - Password: `VeryStrongPassword123!`
- Postgres
  - Host: `localhost:5401`
  - Database: `anomalies`
  - Username: `test`
  - Password: `VeryStrongPassword123!`

That's all you need to meet your first anomaly.

When you decide to move on to the next anomaly, please restart the DB containers. They don't have attached volumes, so every restart will return them to an initial state.
To restart you can simply stop containers and then start them again:

1. `docker-compose down`
2. `docker-compose up`

## References

The main ideas for this repo were taken from this amazing article:

- https://postgrespro.com/blog/pgsql/5967856
