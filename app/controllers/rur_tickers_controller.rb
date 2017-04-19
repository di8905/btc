class RurTickersController < ApplicationController
  def show
    @deals = RurDeal.all.where(created_at: 3.hours.ago..Time.now).order(:updated)
  end
end
