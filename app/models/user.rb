class User < ActiveRecord::Base
	validates :id_number, uniqueness: true
	belongs_to :company
	searchkick
	paginates_per 50

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			User.create! row.to_hash
			Integer(row["company_id"])
			Time.parse(row["ccs_date"])
			Time.parse(row["ces_date"])
		end
	end
	
end
