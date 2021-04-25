Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			resources :amostras
			resources :empresas
			resources :users
			resources :user_empresas
			get 'carregar_empresas', to: 'user_empresas#carregarEmpresas'
			get 'carregar_usuarios', to: 'users#carregarUsuarios'
			post 'authenticate', to: 'authentication#authenticate'
		end
	end
end
