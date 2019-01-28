# Charity Frog

#### Nonprofit Donation Site Ruby/Rails, 12.20.2018

#### By Brooke Perry, Katrina Hockman, Cole Marsteller  and Kristin Brewer-Lowe

## Description

Charity Frog is a site where users can donate to various charities in the Portland, Oregon area. We also connected to the CharityNavigator API to seed national charities (currently only used for environmental and health charities). Charities are sorted by category to make it convenient for users to browse.

Like an ecommerce site, users can add items to their cart, complete the checkout process, create an account to track their order history, and favorite products and track them in their account.

Users can be designated as an admin with privileges to see donation history.

Here is a screenshot of the homepage:

<img src="/app/assets/images/homepage.png" style="width: 700px">

Here is a screenshot of the page where users can view all the nonprofits sorted by category:

<img src="/app/assets/images/all_nonprofits.png" style="width: 700px">

## Future Development
* Add email confirmations for orders
* Add a search bar
* Allow the admin to add, update and delete categories, nonprofits and users from the site
* Pull all content dynamically through the CharityNavigator API

## Setup/Installation Requirements

* View directly here: https://charity-frog.herokuapp.com/
* In the command line, clone this repository with $ git clone https://github.com/klowe27/charity-frog
* Navigate into the directory and in the command line install dependent gems by using command $ bundle install (if you don't already have the bundler gem installed, first run $ gem install bundler)
* To create the necessary database, use the following commands in the command line while in the root directory:
  * $ rake db:create
  * $ rake db:migrate
  * $ rake db:seed
  * $ rake db:test:prepare

* To get a CharityNavigator API key navigate to <a href="https://charity.3scale.net/login" target="blank">their website</a> and register for one. Then set CN_APP_KEY='KEY' in your .env file.
* To get a development Stripe key, navigate to <a href="https://stripe.com/docs/keys" target="blank">their website</a> and register for one. Then set PUBLISHABLE_KEY='KEY' and SECRET_KEY='KEY' in your .env file.
* For Stripe testing purposes start your server with: PUBLISHABLE_KEY=pk_test_TYooMQauvdEDq54NiTphI7jx / SECRET_KEY=sk_test_4eC39HqLyjWDarjtT1zdp7dc rails s
* To launch the application, while in the root directory use command $ rails s
* In any browser (preferably Chrome), navigate to http://localhost:3000/ (most common configuration)
* To run the test suite, use command $ rspec
* To set a user as an admin, in the rails console update admin attribute for the user to true.

Note that if you download the project and seed the database multiple times, you will need to destroy all favorites, orders and order items. These lines of code are included in the seeds.rb file (currently commented out).

## Known Bugs

* On the nonprofit page, if you first enter an amount to donate and then click the heart icon to favorite, the page refreshes and the amount is cleared.
* All nonprofits pulled from the CharityNavigator site use a default image (the API includes an image for some nonprofits, but image size is inconsistent).

## Support and contact details

If you have any questions or issues, please feel free to contribute to the code or reach out to:
  * Kristin: kristin.lowe1@gmail.com
  * Brooke: perrysbrooke@gmail.com
  * Cole: cgm32547@gmail.com

## Technologies Used

Ruby, Rails, Devise, RSpec, FactoryBot, SimpleCov, HTML, CSS, Bootstrap, Git, Stripe, and CharityNavigator API.

### License

This software is licensed under the MIT license.

Copyright (c) 2018 **Brooke Perry, Katrina Hockman, Cole Marsteller  and Kristin Brewer-Lowe**
