class UsdTickersController < ApplicationController
  def show
    @deals = UsdDeal.all
  end
end
