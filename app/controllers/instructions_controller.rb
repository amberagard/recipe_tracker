class InstructionsController
  def initialize(origin_recipe)
    @origin_recipe = origin_recipe
  end

  def add
    puts "Please add recipe instructions:"
    body = clean_gets
    instruction = Instruction.create(body: body, recipe: @origin_recipe)
    unless instruction.valid?
      Menu.selection
    end
  end
end
