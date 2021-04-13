Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			resources :amostras
			resources :empresas
			resources :users
			resources :user_empresas
			post 'authenticate', to: 'authentication#authenticate'
		end
	end
end
