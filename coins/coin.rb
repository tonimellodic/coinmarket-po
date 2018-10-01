class Coin
  def initialize(name, amount)
    @name = name
    @amount = amount
  end

  attr_reader :name
  attr_reader :amount
  attr_accessor :value

  def self.names(coins)
    coins.map(&:name)
  end

  def self.add_prices(coins, prices)
    coins.each do |coin|
      coin.value = prices[coin.name] * coin.amount unless prices[coin.name].nil?
    end
  end

  def self.split_value(coins)
    coins.map do |coin|
      Hash[coin.name, "#{coin.value} USD"]
    end
  end

  def self.total_value(coins)
    coins.map do |coin|
      coin.value.nil? ? 0 : coin.value
    end.sum
  end
end
