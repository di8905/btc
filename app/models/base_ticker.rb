class BaseTicker < ApplicationRecord
  has_many :deals, as: :dealdata
end
