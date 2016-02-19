class User < ActiveRecord::Base
	validates :id_number, uniqueness: true
	belongs_to :company
	searchkick
end
