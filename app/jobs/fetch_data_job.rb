class FetchDataJob < ApplicationJob
  queue_as :default

  def perform(ticker)
    connection = Faraday.new(url: ticker.fetch_url)
    data = JSON.parse(connection.get.body)
    last = data[ticker.data_path]['last']
    updated = data[ticker.data_path]['updated']
    if last && updated
      ticker.deals.create(value: last, updated: updated)
    end
  end
end
