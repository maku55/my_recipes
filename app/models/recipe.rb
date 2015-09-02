class Recipe < ActiveRecord::Base
    belongs_to :chef
    has_many :recipe_styles, dependent: :destroy
    has_many :styles, through: :recipe_styles
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, through: :recipe_ingredients
    validates :name, presence: true, length: {minimum: 5, maximum:100}
    validates :summary, presence: true, length: {minimum: 10, maximum: 150}
    validates :description, presence: true, length: {minimum: 20, maximum: 500}
    validates :chef_id, presence: true
    
end
