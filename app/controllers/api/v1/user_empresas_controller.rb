module Api
	module V1
		class UserEmpresasController < ApplicationController

			def show
				users = UsersEmpresa.where(["id_empresa = ?", params[:id]]).select("id_user")
				render json: {status: 'SUCCESS', message:'Loaded user', data:users},status: :ok
			end

			def carregarEmpresas
				empresas = UsersEmpresa.joins("INNER JOIN empresas ON empresas.id = users_empresas.id_empresa WHERE users_empresas.id_user =", params[:id_user]).select('razao_social, id_empresa')
				render json: {status: 'SUCCESS', message:'Loaded empresas', data:empresas},status: :ok
			end

			private
			def user_params
				params.permit(:id)
			end
		end
	end
end