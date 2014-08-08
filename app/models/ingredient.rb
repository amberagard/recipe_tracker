class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  validates_presence_of :name
  validates_format_of :name, with: /[a-zA-Z]/, message: "must include letters"
  validates_uniqueness_of :name, message: "already exists"
end
