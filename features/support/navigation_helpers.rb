# features/support/navigation_helpers.rb

module NavigationHelpers
  def path_for(page_name)
    case page_name.downcase  # Convert input to lowercase for case-insensitive matching
    when "home"
      root_path
    when "edit writing outlet"
      edit_writing_outlet_path(@writing_outlet)
    when "new writing outlet"
      new_writing_outlet_path
    when "show writing outlet"
      writing_outlet_path(@writing_outlet)
    when "index writing outlets"
      writing_outlets_path
    else
      raise "No path defined for '#{page_name}'. Please define it in the navigation helper."
    end
  end
end

# Make this module available globally in Cucumber
World(NavigationHelpers)