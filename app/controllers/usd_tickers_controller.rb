class UsdTickersController < ApplicationController
  def show
    @deals = UsdDeal.all.order(:updated)
  end
end
