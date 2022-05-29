Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :widgets, only: [:show, :index]
  get 'manufacturer/:id', to: 'manufacturers#show'

  ###
  # Custom routes start her
  #
  # For each new custom route:
  #
  # * Be sure you have the canonical route declared above
  # * Add the new custom route below the existing ones
  # * Document why it's needed
  # * Explain anything else non-standar

  # Used in podcast ads for the 'amazing' campaign
  get '/amazing', to: redirect('/widgets')
  # or
  # get '/amazing', to: 'widgets'

end
