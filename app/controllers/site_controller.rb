class SiteController < ApplicationController

	def index
		@contacts = Contact.order(name: :asc)
	end

	def search
		@search = Contact.search(search_params)
		redirect_to '/'
	end

	private

		def search_params
			params.require(:search).permit(:query)
		end
end
