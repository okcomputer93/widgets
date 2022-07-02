# Widgets - The App For Widgets

## Setup

1. Pull down the app from version control
2. Make sure you have Postgres running
3. `bin/setup`

## Running the App

1. `bin/run`

## Tests and CI

1. `bin/ci` contains all the tests and checks for the app
2. `tmp/test.log` will use the production logging forma *not* the development one.

## Production
*  All runtime configuration should be supplied in the UNIX environment
*  Rails logging uses lograge. `bin/setup help`
   can tell you how to see this locally

## Example Requirements
* Users must provide a name, manufacturer and price. These will be validated using the domain rules we've discussed previously. the name must exist and be unique per manufacturer, and the price must be within 1 cent and $10,000.
* Additionally, a widget name must be more than five characters.
* Widgets are created with the status of "Fresh".
* Widgets for manufacturers created before 2010 may not be prices below $100, for legacy reasons from a past project.
* When a widget is created for more than $7,500, email the financial staff.
* When a widget is created for a manufacturer created in the last two months, email the admin staff.
