# README

Sample Docker Implementation of Solidus using Postgres

## Requirements

- Docker
- Docker Compose

## Install

To run, do the following:

```
docker-compose build
docker-compose run --rm app bundle exec rake db:setup spree_sample:load
docker-compose up
```

Navigate your browser to http://localhost:3000/

To terminate run

```
docker-compose down
```
