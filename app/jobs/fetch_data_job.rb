class FetchDataJob < ApplicationJob
  queue_as :default

  def perform(deal_type)
    deal_klass = deal_type.constantize
    connection = Faraday.new(url: deal_klass::DATA_FETCH_URL)
    byebug
    data = JSON.parse(connection.get.body)
    last = data[deal_klass.data_path]['last']
    updated = data[deal_klass.data_path]['updated']
    if last && updated
      deal_klass.create(value: last, updated: updated)
    end
  end
end
