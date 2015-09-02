class ChefsController < ApplicationController
	def index
	end
	def create
		#render 'index'
	@chef=Chef.new(chef_params)
	#@recipe.chef=current_user
	if @chef.save
		flash[:notice]="You account was successfully created"
		redirect_to recipes_path
	else
		flash[:notice]="Account was not create.Please try agian"
		redirect_to signup_path
	end
	end
private
def chef_params
	params.require(:chef).permit(:chefname, :email, :password)
end
#def set_chef
	#@chef=Chef.find(params[:email])
#end
#end
end