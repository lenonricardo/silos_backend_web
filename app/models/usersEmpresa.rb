class UsersEmpresa < ApplicationRecord
	validates :id_user, presence: true
	validates :id_empresa, presence: true
end
