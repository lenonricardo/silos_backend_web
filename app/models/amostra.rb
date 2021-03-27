class Amostra < ApplicationRecord
	validates :json, presence: true
	validates :img, presence: true
	validates :descricao, presence: true
	validates :id_user, presence: true
end
