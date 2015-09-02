class RecipesController < ApplicationController
	before_action :set_recipe, only:[:show, :edit, :update]
def index
	#@recipes=Recipe.all
	@recipes=Recipe.paginate(page:params[:page], per_page: 6)
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
	params.require(:recipe).permit(:name, :summary, :description, :picture)
end
def set_recipe
	@recipe=Recipe.find(params[:id])
end
end
