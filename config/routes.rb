Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			resources :testes
			resources :amostras
			resources :items
			post 'authenticate', to: 'authentication#authenticate'
		end
	end
end
