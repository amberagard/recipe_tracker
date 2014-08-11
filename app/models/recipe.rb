class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_one :instruction

  validates_format_of :name, with: /[a-zA-Z]/, message: "must include letters"
  validates_length_of :name, maximum: 60, message: "must be less than 60 characters"
  validates_presence_of :name
  validates_uniqueness_of :name, message: "already exists"
end
