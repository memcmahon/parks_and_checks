# Parks and Checks

This app exists to help the National Park Service(NPS) collect donations.  It allows users to give donations in $5 increments based on photos managed by the NPS.

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
