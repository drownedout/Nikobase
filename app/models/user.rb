class User < ActiveRecord::Base
	validates :id_number, uniqueness: true
	belongs_to :company
	searchkick
	paginates_per 50
	
end
