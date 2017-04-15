class BaseTicker < ApplicationRecord
  has_many :deals, as: :dealdata
  FETCH_URL = ''

  def fetch_url
    self.class::FETCH_URL
  end
end
