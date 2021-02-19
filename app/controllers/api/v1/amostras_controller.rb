module Api
	module V1
		class AmostrasController < ApplicationController
			# Listar todos os artigos
			def index
				amostra = Amostra.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'Amostras carregadas', data:amostra},status: :ok
			end

			# Listar artigo passando ID
			def show
				amostra = Amostra.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded amostra', data:amostra},status: :ok
			end

			# Criar um novo artigo
			def create
				amostra = Amostra.new(amostra_params)
				if amostra.save
					render json: {status: 'SUCCESS', message:'Saved amostra', data:amostra},status: :ok
				else
					render json: {status: 'ERROR', message:'amostras not saved', data:amostra.erros},status: :unprocessable_entity
				end
			end

			# Excluir artigo
			def destroy
				amostra = Amostra.find(params[:id])
				amostra.destroy
				render json: {status: 'SUCCESS', message:'Deleted amostra', data:amostra},status: :ok
			end

			def update
				amostra = Amostra.find(params[:id])
				if amostra.update(amostra_params)
					render json: {status: 'SUCCESS', message:'Updated amostra', data:amostra},status: :ok
				else
					render json: {status: 'ERROR', message:'amostras not update', data:amostra.erros},status: :unprocessable_entity
				end
			end

			# Parametros aceitos
			private
			def amostra_params
				params.permit(:json)
			end
		end
	end
end