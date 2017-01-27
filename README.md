# Getting started

To get started:

1. Clone this repository
2. Create and migrate the database (see below)


## Ruby version

This project uses Ruby version 2.3.0 and Rails version 5.0.1.

## System dependencies

This project requires a PostgreSQL database. See below for setup instructions.
If you don't already have PostgreSQL installed, you'll need to install that before proceeding.

## Database creation

You'll need to create a database for this project.

Modify the `config/database.yml` to use the username for your system.

`bundle exec rails db:setup`

## Database initialization

Once your database has been setup, run the following:

`bundle exec rails db:setup`

You may also need to run:

```
bundle exec rails db:migrate
bundle exec rails db:test:prepare
```

### How to run the test suite

`bin/rails test`

# API

The examples below assume you're running the application locally on port 3000.

Run `bundle exec rails server`

To start the server.

## Organizations

### Create Organization

```
curl -v -H 'Content-Type: application/json' -XPOST \
  -d '{ "organization": { "name": "MyOrg" } }' \
  'http://localhost:3000/organizations'
```

### List all Organizations

```
curl -v -H 'Content-Type: application/json' \
  'http://localhost:3000/organizations'
```

### Delete Organization (and its events)

```
curl -v -H 'Content-Type: application/json' -XDELETE \
  'http://localhost:3000/organizations/myorg'
```

## Events

### Create Event

```
curl -v -H 'Content-Type: application/json' -XPOST \
  -d '{ "event": { "message": "Hello!", "hostname": "example.com", "timestamp": "2017-01-16 12:24:48" } }' \
  'http://localhost:3000/organizations/myorg/events'
```

### List all Events for all Organizations

```
curl -v -H 'Content-Type: application/json' \
  'http://localhost:3000/events'
```

### List all Events for specific Organization

```
curl -v -H 'Content-Type: application/json' \
  'http://localhost:3000/organizations/myorg/events'
```

### List the last N events for an Organization

```
curl -v -H 'Content-Type: application/json' \
  'http://localhost:3000/organizations/myorg/events?latest=5'
```

### List the last N events for an Organization with a specific hostname

```
curl -v -H 'Content-Type: application/json' \
  'http://localhost:3000/organizations/myorg/events?latest=5&hostname=example.com'
```

### Display organizations with "foreign hostname" events, visit:

```
http://localhost:3000/organizations/foreign_hosts
```
