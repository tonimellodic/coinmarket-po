require_relative 'pages/coinmarket'
require_relative 'coins/coin'
require 'json'

def read_coins
  file = File.read 'mycoins.json'
  my_coins = JSON.parse(file)
  my_coins.keys.map do |coin|
    Coin.new(coin, my_coins[coin])
  end
end

coins = read_coins
page = CoinMarketPage.visit
prices = page.coin_prices(Coin.names(coins))
Coin.add_prices(coins, prices)
money = Coin.split_value(coins)
total = Coin.total_value(coins).round(2)

# TODO print out total
puts "My money: #{money}"
puts "Total: #{total} USD"
