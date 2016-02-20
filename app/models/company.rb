class Company < ActiveRecord::Base
	has_many :users
	before_validation :strip_whitespace
	validates :name, uniqueness: true
	def strip_whitespace
		self.name = self.name.strip unless self.name.nil?
	end
end
