class EurTickersController < ApplicationController
  def show
    @deals = EurDeal.all.where(created_at: 3.hours.ago..Time.now).order(:updated)
  end
end
