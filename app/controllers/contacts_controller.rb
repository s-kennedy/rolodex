class ContactsController < ApplicationController


	def show
		@contact = Contact.find params[:id]
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
	end

	def destroy
		@contact = Contact.find params[:id]
	end

	private 
	def contact_params
		params.require(:contact).permit(:name, :email, :phone)
	end
end
