class UsdTickersController < ApplicationController
  def show
    @deals = UsdDeal.all.where(created_at: 3.hours.ago..Time.now).order(:updated)
  end
end
