module Api
	module V1
		class AuthenticationController < ApplicationController
			skip_before_action :authenticate_request

			def authenticate
				command = AuthenticateUser.call(params[:email], params[:password])
				user = User.where(["email = ?", params[:email]]).select("name, email, id, nivel").first
				empresa = UsersEmpresa.where(["id_user = ?", user[:id]]).select('id_empresa').first

				if command.success?
					render json: { auth_token: command.result, user: user, empresa: empresa }
				else
					render json: { error: command.errors }, status: :unauthorized
				end
			end
		end
	end
end
