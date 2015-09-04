class RecipesController < ApplicationController
	before_action :set_recipe, only:[:show, :edit, :update]
	before_action :require_user, except: [:show, :index]
	before_action :require_same_user, only:[:edit, :update]
	before_action :admin_user, only: [:destroy]
def index
	#@recipes=Recipe.all
	@recipes=Recipe.paginate(page:params[:page], per_page: 3)
end

def new
	@recipe=Recipe.new
end
def edit
end
def update
    
     if @recipe.update(recipe_params)
     	flash[:notice]='Recipe was successfully updated'
     	redirect_to recipe_path(@recipe)
     else
     	render :edit
	end
end
def like
	like=Like.create(like: params[:like],chef:current_user, recipe:@recipe)
	if like.valid?
		flash[:sucess]="Your selection was successful"
		redirect_to :back
	else
		flash[:danger]="You can only like/dislike only once"
		redirect_to :back
	end
end
def show	
end
def create
	@recipe=Recipe.new(recipe_params)
	@recipe.chef=current_user
	if @recipe.save
		flash[:notice]="Recipe was created successfully"
		redirect_to recipes_path
	else
		flash[:notice]="Recipe was not create"
		render 'new'
	end
end
def destroy
	Recipe.find(params[:id]).destroy
	flash[:notice]='Recipe successfully destroyed'
	redirect_to recipes_path
	end
private
def recipe_params
	params.require(:recipe).permit(:name, :summary, :description, :picture, :recipe_id, style_ids: [], ingredient_ids: [])
end
def require_same_user
	if current_user != @recipe.chef and !current_user.admin?
		flash[:danger]="You must be logged in to perform that action"
		redirect_to recipes_path
	end
end
def set_recipe
	@recipe=Recipe.find(params[:id])
end
def admin_user
	redirect_to recipes_path unless current_user.admin?
end
end
