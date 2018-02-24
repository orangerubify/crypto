class StockExchange < ApplicationRecord
  scope :is_active, (-> { where(active: true) })

  def as_json(_options = {})
    {
      id: id,
      name: name,
      description: description,
      website: website
    }
  end

  def self.bitfinex_request(code)
    url = URI("https://api.bitfinex.com/v1/pubticker/#{code}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = http.request(request)
    response.read_body
  end

  def self.bitfinex_list
    arr = []
    arr << StockExchange.bitfinex_request('btcusd')
    arr << StockExchange.bitfinex_request('ethusd')
    arr << StockExchange.bitfinex_request('etcusd')
    arr
  end
end
