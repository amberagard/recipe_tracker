class Instruction < ActiveRecord::Base
  belongs_to :recipe

  validates_presence_of :name
end
