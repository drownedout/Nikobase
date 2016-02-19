class User < ActiveRecord::Base
	belongs_to :company
	searchkick
end
