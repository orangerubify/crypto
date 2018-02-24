module Api
  class StockExchangesController < BaseController
    def all
      render json: {
        data: StockExchange.is_active,
        result: 'successful'
      }
    end

    def details
      render json: {
        data: StockExchange.bitfinex_list,
        result: 'successful'
      }
    end
  end
end
