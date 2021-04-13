module Api
	module V1
		class UserEmpresasController < ApplicationController

			def show
				users = UsersEmpresa.where(["id_empresa = ?", params[:id]]).select("id_user")
				render json: {status: 'SUCCESS', message:'Loaded user', data:users},status: :ok
			end

			private
			def user_params
				params.permit(:id)
			end
		end
	end
end