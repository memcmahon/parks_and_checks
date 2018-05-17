# Parks and Checks

Deployed on Heroku: [Parks and Checks](http://parksandchecks.herokuapp.com/)

This app exists to help the National Park Service(NPS) collect donations.  It allows users to give donations in $5 increments based on photos managed by the NPS. This was an individual project completed over 2.5 weeks.  One of the biggest takeaways from this project was the use of Sidekiq to queue and process slow-running functions.  It also gave me a taste of CDN usage for increased speed.

The app leverages the NPS Api, Google OAuth, Sidekiq/Redis, and Heroku sheduler.

## Setup

`$ git clone https://github.com/memcmahon/parks_and_checks.git`

`$ cd parks_and_checks`

`$ bundle`

The next step may take a few minutes - 
`$ rails db:create db:migrate`

`$ rake grab_images`

to run locally:
`$ rails s`

## Requirements

This app requires ruby version 2.4 or greater.
