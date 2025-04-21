---
title: gcp-baseball-analytics

---

# gcp-baseball-analytics

This project builds a baseball analytics pipeline using Google BigQuery. The setup follows a layered ELT structure and applies modular modeling techniques for scalability and maintainability.

## Project Setup

The project starts from three publicly available base tables and processes them through three layers:
- Raw layer: source tables loaded into BigQuery for traceability.
- Staging layer: cleaned and enriched transformations.
- Mart layer: optimized output tables for dashboarding.
This approach ensures separation of concerns and supports long-term extensibility.

## Modeling Approach
![ERD of the model](https://github.com/Joepd1/gcp-baseball-analytics/blob/main/docs/gcp-ert.png)

The data model follows a star schema design with fact and dimension tables:
- Fact tables: e.g. game and event data.
- Dimension tables: teams, players, venues, game types, outcomes, etc.
- Data marts: aggregated views for Looker Studio dashboards (e.g. team standings, pitcher performance).
![gcp-conceptual-modle](https://github.com/Joepd1/gcp-baseball-analytics/blob/main/docs/gcp-conceptual-modle.jpg)

A conceptual model ("Player performs Event in a Game, part of a Season, played by a Team in a Venue") underlies the relational ERD.

## Development Environment
Queries are written in SQL and executed from VS Code using the SQLTools extension with the BigQuery driver. Formatting is handled using Prettier for SQL.
The SQL files are organized in a mirrored folder structure:
sql/
--01_raw/
--02_stg/
--03_marts/
test/
Each query corresponds to the creation of a table in its respective layer.

## Design Principles
This project adopts the ELT pattern, as recommended by Google Cloud:
"ELT differs from ETL in that data is loaded into a data warehouse and then transformed, instead of the opposite. This reduces the need for separate ETL infrastructure and minimizes the learning curve."Google Cloud - Data Integration

For best practices on modeling and modular transformations, the following references were used:
- [Dbt labs: Modular data modeling techniques](https://www.getdbt.com/blog/modular-data-modeling-techniques)
- [Mastering data transformation with the power of staging and mart layers – Sulfi Bashy](https://www.linkedin.com/pulse/mastering-data-transformation-power-staging-mart-layers-sulfi-bashy-nqjtf/)
- [Best practices for designing data models – LinkedIn Advice](https://www.linkedin.com/advice/0/what-best-practices-designing-data-models-twfsf)

Git commit messages are structured according to:
- [Semantic commit message conventions – GitHub Gist](https://gist.github.com/luismts/495d982e8c5b1a0ced4a57cf3d93cf60) 

Schema Design Star schema structure is applied for readability and efficient querying:
- Fact tables remain normalized.
- Dimension tables are denormalized where appropriate to reduce joins.

Reference:
[Star Schema explanation](https://www.youtube.com/watch?v=gRE3E7VUzRU)

[Star Schema glossary – Databricks](https://www.databricks.com/glossary/star-schema)
