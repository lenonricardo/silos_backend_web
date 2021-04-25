class Empresa < ApplicationRecord
	validates :razao_social, presence: true
	validates :cnpj, presence: true
	validates :logradouro, presence: true
	validates :bairro, presence: true
	validates :cidade, presence: true
	validates :cep, presence: true
	validates :telefone, presence: true
	validates :img_logo, presence: false
end
