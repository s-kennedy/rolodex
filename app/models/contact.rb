class Contact < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :phone, presence: true

	def self.search(query)
		where("name like ?", "%#{query}%")
	end

end

