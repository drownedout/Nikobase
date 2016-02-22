class User < ActiveRecord::Base
	validates :id_number, uniqueness: true
	belongs_to :company
	searchkick
	paginates_per 50

	def self.import(file)
		@id_number = User.pluck(:id_number)

		CSV.foreach(file.path, headers: true) do |row|
				unless @id_number.include? Integer(row["id_number"])
				User.create! row.to_hash
				Integer(row["id_number"])
				Integer(row["company_id"])
				Time.parse(row["ccs_date"])
				Time.parse(row["ces_date"])
			end
		end
	end	
end
