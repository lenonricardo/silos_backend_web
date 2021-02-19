module Api
	module V1
		class TestesController < ApplicationController
			# Listar todos os artigos
			def index
				testes = Teste.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Artigos carregados', data:testes},status: :ok
			end

			# Listar artigo passando ID
			def show
				article = Teste.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded article', data:article},status: :ok
			end

			# Criar um novo artigo
			def create
				article = Teste.new(article_params)
				if article.save
					render json: {status: 'SUCCESS', message:'Saved article', data:article},status: :ok
				else
					render json: {status: 'ERROR', message:'Articles not saved', data:article.erros},status: :unprocessable_entity
				end
			end

			# Excluir artigo
			def destroy
				article = Teste.find(params[:id])
				article.destroy
				render json: {status: 'SUCCESS', message:'Deleted article', data:article},status: :ok
			end

			def update
				article = Teste.find(params[:id])
				if article.update(article_params)
					render json: {status: 'SUCCESS', message:'Updated article', data:article},status: :ok
				else
					render json: {status: 'ERROR', message:'Articles not update', data:article.erros},status: :unprocessable_entity
				end
			end

			# Parametros aceitos
			private
			def article_params
				params.permit(:title, :body)
			end
		end
	end
end