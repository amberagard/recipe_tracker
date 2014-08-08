class Router
  def self.navigate_recipes_menu(recipes_controller)
    command = clean_gets

    case command
    when "add"
      recipes_controller.add
    when /\d+/
      recipes_controller.view(command.to_i)
    else
      puts "I don't know the '#{command}' command."
    end
  end
end
