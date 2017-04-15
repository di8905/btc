require 'rails_helper'

RSpec.describe Deal, type: :model do
  it { should belong_to :dealdata }
end
