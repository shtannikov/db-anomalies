## General

The main goal of this repo is to compare MS SQL and PostgreSQL in terms of anomalies and, as a result, better understand the key differences between Locking-Based Concurrency Control and Multiversion Concurrency Control.

## Getting Started

This repo provides a zero-setup playground in GitHub Codespaces. With just one click, you can dive into experiments without the need for manual database configuration.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/shtannikov/db-anomalies?quickstart=1)

### How It Works
1. Click the button above.
2. Codespace will launch, automatically preparing all required databases and environment configurations for you.

   👉 It may take up to two minutes to prepare everything the first time 👈
4. Start experimenting with the provided SQL scripts directly in your browser


### Repository Structure

Each folder in this repository corresponds to a specific database anomaly. Inside, you'll find:
- **Documentation**: A brief explanation of the anomaly.
- **SQL scripts**: reproducible examples for both MS SQL and PostgreSQL.

### Demo

https://github.com/user-attachments/assets/33ba1f97-3549-462a-87f7-0d0cf5dd0cde

## References

This repository draws inspiration from the following article, which provides excellent insights into database anomalies:

- https://postgrespro.com/blog/pgsql/5967856
