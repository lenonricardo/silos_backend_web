module Api
	module V1
		class AuthenticationController < ApplicationController
			skip_before_action :authenticate_request

			def authenticate
				command = AuthenticateUser.call(params[:email], params[:password])
				user = User.where(["email = ?", params[:email]]).select("name, email, id, nivel").first

				if command.success?
					render json: { auth_token: command.result, user: user }
				else
					render json: { error: command.errors }, status: :unauthorized
				end
			end
		end
	end
end
