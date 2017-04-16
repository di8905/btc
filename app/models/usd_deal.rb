class UsdDeal < Deal
  DATA_FETCH_URL = 'https://btc-e.nz/api/3/ticker/btc_usd'

  def self.data_path
    'btc_usd'
  end
end
