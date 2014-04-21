Springtea::Application.routes.draw do
  get "statics/index"
  resources :uploads, :only => [:index, :create, :destroy]

  root :to => "statics#index"
end
