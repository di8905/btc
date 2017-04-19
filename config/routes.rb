Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'usd_tickers#show'

  resource :usd_ticker, only: :show
  resource :eur_ticker, only: :show
  resource :rur_ticker, only: :show

  mount ActionCable.server => '/cable'
end
