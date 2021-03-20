module Api
	module V1
		class UsersController < ApplicationController
			def index
				user = User.order('created_at DESC').select('name', 'email', 'id', 'nivel', 'created_at', 'updated_at');
				render json: {status: 'SUCCESS', message:'users carregadas', data:user},status: :ok
			end

			def show
				user = User.where(["id = ?", params[:id]]).select("name, email, id, nivel").first
				render json: {status: 'SUCCESS', message:'Loaded user', data:user},status: :ok
			end

			def create
				user = User.find_by_email(user_params[:email])

				if !user
					users = User.new(user_params)
					if users.save
						render json: {status: 'SUCCESS', message:'Usuário cadastrado com sucesso.', data:users},status: :ok
					else
						render json: {status: 'ERROR', message:'Ocorreu um erro ao gravar o cadastro.', data:users.errors},status: :unprocessable_entity
					end
				else
					render json: {status: 'ERROR', message:'Usuário já cadastrado.' },status: :unprocessable_entity
				end
			end

			def destroy
				user = User.find(params[:id])
				user.destroy
				render json: {status: 'SUCCESS', message:'Usuário excluído com sucesso!', data:user},status: :ok
			end

			def update
				user = User.find(params[:id])
				if user.update(user_params)
					render json: {status: 'SUCCESS', message:'Usuário alterado com sucesso', data:user},status: :ok
				else
					render json: {status: 'ERROR', message:'users not update', data:user.erros},status: :unprocessable_entity
				end
			end

			private
			def user_params
				params.permit(:email, :password, :password_confirmation, :name, :nivel)
			end
		end
	end
end