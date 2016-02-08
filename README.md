## README

* Clone repository and cd into root
* Setup and run MySQL server
* Run `bundle install`
* Run `rails db:setup`
* Install ngrok and run `./ngrok http 3000`
* Make a Twilio account and get a phone number
* Add SMS GET endpoint at `[ngrok url]/messages`
* Run `rails c`, then `Phone.create(name: 'main', number: '[twilio number]')`
* Run `rails s` and visit `http://localhost:3000`
