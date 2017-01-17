# Getting started

## Ruby version

This project uses Ruby version 2.3.0

## System dependencies

This project requires a MySql database. See below for setup instructions.

## Database creation

You'll need to create a database for this project.

`bundle exec rails db:setup`

If you want to use different credentials than the default
`root` username that Rails' assumes for new projects then
modify the `config/database.yml` file to suit your needs.

I didn't create a new user for this project, but typically would
for longer-lived development projects.

## Database initialization

Once your database has been setup, run the following:

`bundle exec rails db:setup`

### How to run the test suite

`bin/rails test`

# API

## Organizations

### Create Organization

curl -v -H 'Content-Type: application/json' -XPOST \
  -d '{ "organization": { "name": "MyOrg" } }' \
  'http://localhost:3000/organizations'

### List all Organizations

curl -v -H 'Content-Type: application/json' \
  'http://localhost:3000/organizations'

### Delete Organization (and its events)

curl -v -H 'Content-Type: application/json' -XDELETE \
  'http://localhost:3000/organizations/myorg'

## Events

### Create Event

curl -v -H 'Content-Type: application/json' -XPOST \
  -d '{ "event": { "message": "Hello!", "hostname": "example.com", "timestamp": "2017-01-16 12:24:48" } }' \
  'http://localhost:3000/organizations/myorg/events'

### List all Events for all Organizations

curl -v -H 'Content-Type: application/json' \
  'http://localhost:3000/events'

### List all Events for specific Organization

curl -v -H 'Content-Type: application/json' \
  'http://localhost:3000/organizations/myorg/events'

### List the last N events for an Organization

curl -v -H 'Content-Type: application/json' \
  'http://localhost:3000/organizations/myorg/events?latest=5'

### List the last N events for an Organization with a specific hostname

curl -v -H 'Content-Type: application/json' \
  'http://localhost:3000/organizations/myorg/events?hostname=example.com'
