class Contact < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :phone, presence: true

	def next
		next_contact = Contact.where("id > ?", self.id).limit(1).first
		if next_contact == nil
			Contact.first.id
		else 
			next_contact.id
		end
	end

	def previous
		previous_contact = Contact.where("id < ?", self.id).reverse_order.limit(1).first
		if previous_contact == nil
			Contact.last.id
		else 
			previous_contact.id
		end
	end

end

