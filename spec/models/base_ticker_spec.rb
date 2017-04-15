require 'rails_helper'

RSpec.describe BaseTicker, type: :model do
  it { should have_many(:deals) }
end
