module Api
	module V1
		class EmpresasController < ApplicationController
			def index
				empresas = Empresa.order('created_at DESC');
				render json: {status: 'SUCCESS', message:'empresas carregadas', data: empresas},status: :ok
			end

			def show
				empresa = Empresa.find(params[:id])
				render json: {status: 'SUCCESS', message:'Empresa carregada.', data: empresa},status: :ok
			end

			def create
				empresa = Empresa.find_by_cnpj(empresa_params[:cnpj])

				if !empresa
					empresa = Empresa.new(
						razao_social: empresa_params[:razao_social],
						cnpj: empresa_params[:cnpj],
						logradouro: empresa_params[:logradouro],
						bairro: empresa_params[:bairro],
						cep: empresa_params[:cep],
						telefone: empresa_params[:telefone],
						img_logo: empresa_params[:img_logo]
					)

					if empresa.save
						usersEmpresas = UsersEmpresa.new(id_user: empresa_params[:id_user], id_empresa: empresa[:id])

						if usersEmpresas.save
							render json: {status: 'SUCCESS', message:'Empresa cadastrada com sucesso!', data: empresa},status: :ok
						end
					else
						render json: {status: 'ERROR', message:'Ocorreu um erro ao salvar a Empresa.', data: empresa.errors},status: :unprocessable_entity
					end
				else
					render json: {status: 'ERROR', message:'Empresa já cadastrada.', data: empresa.errors},status: :unprocessable_entity
				end
			end

			def destroy
				empresa = Empresa.find(params[:id])
				empresa.destroy
				render json: {status: 'SUCCESS', message:'Empresa excluída com sucesso.', data: empresa},status: :ok
			end

			def update
				empresa = Empresa.find(params[:id])
				if empresa.update(empresa_params)
					render json: {status: 'SUCCESS', message:'Empresa alterada com sucesso', data: empresa},status: :ok
				else
					render json: {status: 'ERROR', message:'Ocorreu um erro ao alterar a Empresa.', data: empresa.erros},status: :unprocessable_entity
				end
			end

			private
			def empresa_params
				params.permit(:razao_social, :cnpj, :logradouro, :bairro, :cep, :telefone, :img_logo, :id_user)
			end
		end
	end
end