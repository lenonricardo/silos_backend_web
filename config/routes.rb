Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			resources :testes
			resources :amostras
		end
	end
end
