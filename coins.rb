require_relative 'pages/coinmarket'
require 'json'

def read_coins
  file = File.read 'mycoins.json'
  JSON.parse(file)
end

def my_money_split(prices, my_coins)
  my_coins.keys.map do |coin|
    money = prices[coin] * my_coins[coin] unless prices[coin].nil?
    Hash[coin, "#{money} USD"]
  end
end

def my_money_total(prices, my_coins)
  my_coins.keys.map do |coin|
    prices[coin].nil? ? 0 : prices[coin] * my_coins[coin]
  end.sum
end

my_coins = read_coins
coins = my_coins.keys

page = CoinMarketPage.visit
prices = page.coin_prices(coins)
money = my_money_split(prices, my_coins)
total = my_money_total(prices, my_coins).round(2)

# TODO print out total
puts "My money: #{money}"
puts "Total: #{total}"
