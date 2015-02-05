class ContactsController < ApplicationController

	def index
		@contacts = Contact.order(name: :asc)
	end
	
	def show
		begin
			@contact = Contact.find params[:id]
		rescue ActiveRecord::RecordNotFound
			# @contact = Contact.find params[:id]
			render 'no_contact_found'
		end
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new contact_params
		if @contact.save
			redirect_to '/'
		else 
			render 'new'
		end
	end

	def edit
		@contact = Contact.find params[:id]
		render 'new'
	end

	def update
		@contact = Contact.find params[:id]
		@contact.update_attributes contact_params
		if @contact.save
			redirect_to action: 'show'
		else 
			render 'new'
		end
	end

	def destroy
		@contact = Contact.find params[:id]
		@contact.destroy
		redirect_to contacts_path
	end

	private 
	def contact_params
		params.require(:contact).permit(:name, :email, :phone, :address, :notes)
	end
end
