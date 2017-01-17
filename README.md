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
