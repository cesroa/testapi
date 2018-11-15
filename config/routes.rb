Rails.application.routes.draw do
  #get "welcome/index"
	namespace 'v1' do
		resources :testers
		resources :players
	end
end
