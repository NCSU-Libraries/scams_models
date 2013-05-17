# ScamsModels

ScamsModels is a gem to share models between various Rails applications. The name comes from the main application these models were extracted from called the Special Collections Asset Management System (SCAMS).

## History

SCAMS is a Rails application in use at NCSU Libraries for managing metadata for digital special collections. It was originally migrated from an Access database. As such it is a work in progress to move it little by little to be a better application.

Once the SCAMS data was being reused by other applications it made sense to break out the models into this separate gem engine.

At this point this gem is probably of no use to anyone else.

## Hint

All the models are implemented as Concerns so that the models can be overridden in each app.

## Installation

In your Rails application:

`gem 'scams_models', :git => 'git@github.com:NCSU-Libraries/scams_models.git'`

## Testing

Currently all tests are wrapped up within the SCAMS application.

## Author

Jason Ronallo

## License

See MIT-LICENSE.
