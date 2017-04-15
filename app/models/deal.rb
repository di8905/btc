class Deal < ApplicationRecord
  belongs_to :dealdata, polymorphic: true
end
