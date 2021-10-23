# README

To run the application and tests:

* Clone this repo
* Run docker-compose up
* Once in the docker container, run migrations
bin/rails db:migrate
* Install webpacker
bin/rails webpacker:install
This will install node modules through yarn
Once that is done, we can open the browser on http://localhost:3000 and it will load the application. Data is loaded from the poker.txt file and abstracted into models. While the DB is not compulsory for the application to load, I did take advantage of rails model structure to abstract the Cards, Hands, and Rounds. I only had time to do the Model tests which were super helpful for the development of the engine. It would need some tweaking but I'm not a player myself so I don't know some of the rules.

* To run the tests, go into the running container and run:
```
rspec spec/models/
```


