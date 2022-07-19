Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :widgets, only: [:show, :index, :new, :create]
  resources :widget_ratings, only: [:create]

  if Rails.env.development?
    resources :design_system_docs, only: [:index]
  end
  # Don't
  get 'manufacturer/:id', to: 'manufacturers#show'

  # All API endpoints should go in this namespace.
  # If you need a custom route to an API endpoint,
  # add it in the custom routes section, but make
  # sure the resource-based route is here.
  namespace :api do
    namespace :v1 do
      resources :widgets, only: [ :show ]
    end
  end

  ###
  # Custom routes start here
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
