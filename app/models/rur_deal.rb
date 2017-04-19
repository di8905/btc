class RurDeal < Deal
  DATA_FETCH_URL = 'https://btc-e.nz/api/3/ticker/btc_rur'

  def self.data_path
    'btc_rur'
  end
end
