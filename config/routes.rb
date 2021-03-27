Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			resources :amostras
			resources :users
			post 'authenticate', to: 'authentication#authenticate'
		end
	end
end
