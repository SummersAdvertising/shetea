Springtea::Application.routes.draw do
	resources :uploads, :only => [:index, :create, :destroy]

	PagesController.action_methods.each do |action|
		get "/#{action}", to: "pages##{action}"
	end

	root :to => "pages#under_construction"
end
