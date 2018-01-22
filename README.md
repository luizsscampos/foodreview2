<!--# README-->

<!--This README would normally document whatever steps are necessary to get the-->
<!--application up and running.-->

<!--Things you may want to cover:-->

<!--* Ruby version-->

<!--* System dependencies-->

<!--* Configuration-->

<!--* Database creation-->

<!--* Database initialization-->

<!--* How to run the test suite-->

<!--* Services (job queues, cache servers, search engines, etc.)-->

<!--* Deployment instructions-->

<!--* ...-->

# FoodReview

Constructed a clone of Yelp using following technology
- Rails 5
- Bootstrap
- Sqlite3
- Jquery
- RSpec
- Capybara
- Selenium webdriver
- Carrierwave

![Thermostat](https://github.com/KKOA/foodreview2/blob/master/ScreenShot.png)

## Setup application

The installition assume have homebrew install on the current device

```
git clone
cd foodreview
bundle
brew install imagemagick
rails s db:reset
```

## Run application
```
cd cd foodreview
rails s
```
Navigate to browser and enter<br>
http://localhost:3000<br>
and hit return

## Run Tests
```
cd foodreview
bundle exec guard
```
Hit enter to view all test
