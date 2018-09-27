require 'page-object'

class CoinMarketPage
  include PageObject
  Watir.default_timeout = 1

  def self.visit
    browser = Watir::Browser.new :chrome
    browser.goto 'https://coinmarketcap.com/'
    self.new browser
  end

  def coin_prices(coins = ['bitcoin'])
    coins.map { |coin| [coin, coin_price(coin)] }.to_h
  end

  private

  def coin_price(coin)
    browser.element(css: "#id-#{coin} .price").attribute_value('data-usd').to_f
  rescue Watir::Exception::UnknownObjectException
    # coin could not be found
    return nil
  end
end
