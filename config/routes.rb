Rails.application.routes.draw do

  get 'bondis' => 'bondis#list'
  get 'proximos' => 'bondis#upcoming'

end
