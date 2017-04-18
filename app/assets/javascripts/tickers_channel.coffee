App.tickersChannel = App.cable.subscriptions.create 'TickersChannel',
  connected: ->
    # @installPageChangeCallback()
    @followTickerStream()
    return
  received: (data) ->
    return

  followTickerStream: ->
    if $('#ticker-type').length
      type = $('#ticker-type').data('type')
      @perform 'subscribe_ticker_stream', type: type
    else
      @perform 'unsubscribe_ticker_stream'
