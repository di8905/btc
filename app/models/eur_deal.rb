class EurDeal < Deal
  DATA_FETCH_URL = 'https://btc-e.nz/api/3/ticker/btc_eur'

  def self.data_path
    'eur_usd'
  end
end
