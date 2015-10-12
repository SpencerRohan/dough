# Dough
### Summary
Search for companies by NAME or SYMBOL. Once your selection has been found a graph of the last 30 days worth of stock prices will be provided in a graph presentation for your viewing pleasure.

### To Install
+ Copy and install this repository to your local directory
```
    git clone https://github.com/SpencerRohan/dough.git
```
+ Bundle install
```
    bundle install
```
+ Set up and migrate database
```
    be rake db:create db:migrate db:install
```
*Note: 'db:install' pulls data from 3 CSV files into the database. These are company names and stock symbol information*
+ Run Server
```
    rails s
```
+ Open browser(Google Chrome recommended) and navigate to localhost:3000

### Quick View
A version has been uploaded to Heroku and may viewed  [HERE](https://desolate-anchorage-6823.herokuapp.com).