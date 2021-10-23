# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

To run the application and tests:

* Clone this repo
* Run docker-compose up
* Once in the docker container, run migrations
bin/rails db:migrate
* Install webpacker
bin/rails webpacker:install
This will install node modules through yarn

