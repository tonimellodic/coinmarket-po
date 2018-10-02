# coinmarket-po
Using a page object to obtain crypto currency values based on a configurable json file.

## Getting Started

### Prerequisites

- Ruby
- bundle
- [chromedriver](http://chromedriver.storage.googleapis.com/index.html) in your `PATH`

### Installing

```
bundle install
```

Additionally, you need

## Running the script

### Define your coin list

Copy the example file `coinlist.json.dist` into `coinlist.json` with your desired coins and their amounts:

```
{
  "bitcoin": 0.5,
  "ethereum": 3,
  "iota": 10
}
```

### Run

```
ruby mycoins.rb
```
