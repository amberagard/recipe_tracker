class Menu
  def self.options
%q{
 _    _        _                                    _
| |  | |      | |                                  | |
| |  | |  ___ | |  ___   ___   _ __ ___    ___     | |_   ___
| |/\| | / _ \| | / __| / _ \ | '_ ` _ \  / _ \    | __| / _ \
\  /\  /|  __/| || (__ | (_) || | | | | ||  __/    | |_ | (_) |
 \/  \/  \___||_| \___| \___/ |_| |_| |_| \___|     \__| \___/


______              _                  _____                     _
| ___ \            (_)                |_   _|                   | |
| |_/ /  ___   ___  _  _ __    ___      | |   _ __   __ _   ___ | | __  ___  _ __
|    /  / _ \ / __|| || '_ \  / _ \     | |  | '__| / _` | / __|| |/ / / _ \| '__|
| |\ \ |  __/| (__ | || |_) ||  __/     | |  | |   | (_| || (__ |   < |  __/| |
\_| \_| \___| \___||_|| .__/  \___|     \_/  |_|    \__,_| \___||_|\_\ \___||_|
                      | |
                      |_|
Select an option from the choices below:
1. Create new recipe
2. View current recipes
3. Find recipes by ingredient
4. Edit a recipe
}
  end

  def self.selection
    puts self.options
    input = gets
    return unless input
    input.chomp!
    if input == "1"
      puts "Please enter a name for the new recipe:"
    elsif input == "2"
      puts "Please select a recipe you would like to view:"
    elsif input == "3"
      puts "Please enter an ingredient you would like to search by:"
    elsif input == "4"
      puts "Please select a recipe you would like to edit:"
    else puts "'#{input}' is not a valid selection."
      self.selection
    end
  end
end