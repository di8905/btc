class EurTicker < BaseTicker
  FETCH_URL = 'https://btc-e.nz/api/3/ticker/btc_eur'

  def data_path
    'btc_eur'
  end
end
