class UsdTicker < BaseTicker
  FETCH_URL = 'https://btc-e.nz/api/3/ticker/btc_usd'

  def data_path
    'btc_usd'
  end
end
