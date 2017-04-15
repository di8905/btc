class BaseTicker < ApplicationRecord
  has_many :deals, as: :dealable
  FETCH_URL = ''

  def fetch_url
    self.class::FETCH_URL
  end
end
