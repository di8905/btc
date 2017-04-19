class TickersChannel < ApplicationCable::Channel
  def subscribe_ticker_stream(data)
    stop_all_streams
    stream_from "#{data['type']}"
  end

  def unsubscribe_ticker_stream
    stop_all_streams
  end
end
