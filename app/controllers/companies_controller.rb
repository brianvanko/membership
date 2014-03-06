class CompaniesController < ApplicationController
	def index
		@companies = Company.all

		@loc = @companies.clone
		
		#@companies.uniq!
		#@companies.inject([]) { |result,h| h[:count]=@loc.count(h) if @loc.count(h) > 1 ; result << h; result }

		@hash = Gmaps4rails.build_markers(@companies) do |company, marker|
		  marker.lat company.latitude
		  marker.lng company.longitude
		  marker.infowindow company.name
		end

		@categories = Category.all
	end

	def show
		@company = Company.find(params[:id])
	end

	def edit
		@company = Company.find(params[:id])
	end

	def update
		@company = Company.find(params[:id])
		if @company.update_attributes(company_params)
	      redirect_to @company, notice: 'Item was successfully updated.'
	    else
	      render action: 'edit' 
	    end
	end

	def company_params
      params.require(:company).permit(:phone,:address,:city,:state,:zipcode, :url, :description, :name, :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at, :categories)
    end
end