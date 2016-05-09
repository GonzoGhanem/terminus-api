Rails.application.routes.draw do

  get 'bondis/:origin/:destination' => 'bondis#list'
  get 'proximos/:origin/:destination' => 'bondis#upcoming'
  get 'destinations' => 'destinations#index'
  post 'requests' => 'requests#create'
end
