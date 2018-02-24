require 'test_helper'

class StockExchangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_exchange = stock_exchanges(:one)
  end

  test "should get index" do
    get stock_exchanges_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_exchange_url
    assert_response :success
  end

  test "should create stock_exchange" do
    assert_difference('StockExchange.count') do
      post stock_exchanges_url, params: { stock_exchange: { active: @stock_exchange.active, description: @stock_exchange.description, name: @stock_exchange.name, priority: @stock_exchange.priority, website: @stock_exchange.website } }
    end

    assert_redirected_to stock_exchange_url(StockExchange.last)
  end

  test "should show stock_exchange" do
    get stock_exchange_url(@stock_exchange)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_exchange_url(@stock_exchange)
    assert_response :success
  end

  test "should update stock_exchange" do
    patch stock_exchange_url(@stock_exchange), params: { stock_exchange: { active: @stock_exchange.active, description: @stock_exchange.description, name: @stock_exchange.name, priority: @stock_exchange.priority, website: @stock_exchange.website } }
    assert_redirected_to stock_exchange_url(@stock_exchange)
  end

  test "should destroy stock_exchange" do
    assert_difference('StockExchange.count', -1) do
      delete stock_exchange_url(@stock_exchange)
    end

    assert_redirected_to stock_exchanges_url
  end
end
