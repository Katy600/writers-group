When('I click on {string} link') do |link_text|
  click_link(link_text)
end

Given(/^(?:I am on|I go to|I visit) the {string} page$/) do |page_name|
  visit path_for(page_name)
end