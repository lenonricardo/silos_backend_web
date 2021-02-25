class Amostra < ApplicationRecord
	validates :json, presence: true
	validates :img, presence: true
	validates :text, presence: true
end
