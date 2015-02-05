class SiteController < ApplicationController

	def index
		@contacts = Contact.order(name: :asc)
		@results = Contact.where(name: params[:query])
	end

end
