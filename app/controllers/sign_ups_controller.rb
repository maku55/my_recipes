class SignUpsController < ApplicationController
	#before_action :set_chef, only: :signup
	def signup
		@chef=Chef.new
	end
	def create
		redirect_to chefs_path
	end
end

#private
#def set_params
	#params.require(:chef).permit(:chefname, :email, :password)
#end
#def set_chef
	#@chef=Chef.find(params[:email])
#end
#end