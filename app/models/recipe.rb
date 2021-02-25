class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates_presence_of :name

    accepts_nested_attributes_for :ingredients

    def ingredients_attributes=(ingredient_attributes)
        ingredient_attributes.values.each do |attribute|
            ingredient = Ingredient.find_or_create_by(attribute)
            self.recipe_ingredients.build(ingredient: ingredient)
        end 
    end

end
