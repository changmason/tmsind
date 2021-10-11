# Tmsind 臺北市運動產業業者名單

## About this project

  This project implements a simple CRUD app for managing companies in the sport-related industry of Taipei. The initial data of the companies are imported from `tmsind.csv`. This app also provides a "search" feature for filtering the companies by their `name`, `telephone`, `address`, `email`, `main_type`, `sub_type` and `company_no`.

  The demo site is available on heroku: https://tmsind.herokuapp.com/

## To start up

  Make sure you have `ruby 3.0.2p107` installed on your system. If you don't,  please update `Gemfile` based on what you have.

  This project also requires `NodeJS` with `yarn` package manager, you can visit these websites for more information:

  - https://nodejs.org/en/
  - https://yarnpkg.com/

### Build the project

  1. Clone and `cd` to the project
  2. Run command `bundle install --without production` to install ruby dependencies
  3. Run command `yarn install` to install js dependencies
  4. Run command `rails db:create` to create the database
  5. Run command `rails db:migrate` to create the tables
  6. Run command `rails data:migrate` to import initial data

### Run the server

  Run command `rails server` to start the development server and then visit http://127.0.0.1:3000

### Run the tests

  Run command `bundle exec rspec -f documentation` to run all the tests and output the results in documentation format.
