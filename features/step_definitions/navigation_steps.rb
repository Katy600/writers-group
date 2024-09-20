Given('I am on the homepage') do
  visit root_path # or specify your homepage path
end

When('I click on {string} link') do |link_text|
  click_link(link_text)
end

Then('I should be on the {string} page') do |page_name|
  case page_name
  when "Start Writing"
    expect(page).to have_current_path( writing_outlet_path) # replace with actual path
    # Add other pages as needed
  else
    raise "Path for #{page_name} not defined"
  end
end