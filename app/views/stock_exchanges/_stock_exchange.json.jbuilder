json.extract! stock_exchange, :id, :name, :description, :website, :active, :priority, :created_at, :updated_at
json.url stock_exchange_url(stock_exchange, format: :json)
