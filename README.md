# David's Digital Deal Finder

David's Digital Deal Finder is a Rails web application that allows users to view, wishlist, and review daily tech deals from a variety of electronics retailers, including eBay, Best Buy, Walmart, Newegg, and Micro Center. This app will facilitate and expedite the process of finding and saving good electronics deals for tech-oriented consumers.

## Installation

David's Digital Deal Finder can be downloaded from https://github.com/dmaster18/davids_digital_deal_finder_final. Once the program is downloaded, go to the program's directory from your local Terminal/Command Line and then run bundle install or bundle exec install to ensure all the dependencies are installed. After, run rake db:migrate or rails db:migrate to set up the database. In order to populate the database with tech deals, users will want to run the following command DealScraper.new.generate_items inside of the rails console, or rails c. To get the most up-to-date deals, users will want to execute this command each time before using David's Digital Deal Finder.

Once all the dependencies have been installed and deals have been created, run the rails s command from your machine to initiate the web application.

## Usage

Once your local server is up and running the application, go to the HTML address indicated after the "Listening on.." from Rails S, and follow that URL with the slash sign, "/", to arrive at the welcome page of David's Digital Deal Finder. For example, on my current setup, Rails S instructs me to go to "127.0.0.1:3000", so in my browser, I enter the following URL: "127.0.0.1:3000/". From the welcome page, the user will be greeted links to either sign up, if the user is new, or log in, if the user already has an account. When signing up for the first time, the user must make sure to enter a unique username as well as a password that is at least eight characters long and contains at least one capital letter, one number, and one special character. If the user fails to sign up or log in, he or she should be greeted with error(s) in red text alerting him or her of the mistake. If the user doesn't want to manually create a username and password, the user can bypass the traditional sign-in process by signing in using his or her GitHub account, which implements the OAuth gem.

Once logged in, the user will arrive at a home page that has links to either view or create tech deals, wishlists, and reviews. Once a user creates a wishlist, he will be able to add any tech deal on the web app to that list. In addition to adding or removing deals from wishlists, the user can also give glowing or negative reviews to deals. The user will be able to create new deals as well as edit and/or deal any existing ones. However, the user will only have the ability to modify his own personal reviews and wishlists, since no user has the right to edit or destroy someone else's reviews or wishlists. The user will have the ability to read other consumers' reviews, however, but not have the ability to read their wishlists.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dmaster18/davids_digital_deal_finder_final/pulls. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
