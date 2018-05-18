# Parks and Checks

Deployed on Heroku: [Parks and Checks](http://parksandchecks.herokuapp.com/)

This app exists to help the National Park Service(NPS) collect donations.  It allows users to give donations in $5 increments based on photos managed by the NPS. This was an individual project completed over 2.5 weeks.  One of the biggest takeaways from this project was the use of Sidekiq to queue and process slow-running functions.  It also gave me a taste of CDN usage for increased speed.

The app leverages the NPS Api, Google OAuth, Sidekiq/Redis, and Heroku scheduler.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them

* Ruby 2.4 or greater
* Rails 5
* Stripe Account
* National Parks Service API Key
* Cloudinary Account

### Installing

A step by step series of examples that tell you have to get a development env running

Clone and CD into the repo and bundle:

`$ git clone https://github.com/memcmahon/parks_and_checks.git`
`$ cd parks_and_checks`
`$ bundle install`

The next step may take a few minutes, create the database, migrate and seed:

`$ rails db:create db:migrate`
`$ rake grab_images`

to run locally:
`$ rails s`

In order to fully use the app, you will need to create both a `config/application.yml` and a `config/cloudinary.yml` file that will include the following information:

* Your google app identification
* Your NPS Deveopler API Key
* Your Stripe identification
* Your Cloudinary identification and environment settings

## Running the test suite

To run the test suite:

`$ rspec`


## Built With

* [Rails](http://guides.rubyonrails.org/) - The web framework used
* [NPS API](https://www.nps.gov/subjects/digital/nps-data-api.htm) - To grab National Park images
* [GoogleOauth](https://github.com/zquestz/omniauth-google-oauth2) - To handle authentication
* [Stripe](https://stripe.com/docs) - For credit card payments
* [Sidekiq/Redis](https://github.com/mperham/sidekiq) - To queue credit card payments
* [Cloudinary](https://cloudinary.com/) - For hosting images


## Authors

* **Megan McMahon**

## Acknowledgments

* Thanks to Katy Walyczko for the inspiration!
