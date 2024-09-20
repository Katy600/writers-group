
Given('I am on the writing outlet page') do
  new_writing_outlet_path
end

When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value
end

When('I press {string}') do |button|
  click_button button
end

Then('I should see {string}') do |message|
  expect(page).to have_content(message)
end
