class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates_presence_of :name
  validates_format_of :name, with: /[a-zA-Z]/, message: "must include letters"
  validates_uniqueness_of :name, message: "already exists", scope: :recipe_id

  def self.options
%q{
Would you like to add an ingredient?:
1. Yes, I'd like to add an ingredient.
2. No, I am done adding ingredients.
}
  end
end
