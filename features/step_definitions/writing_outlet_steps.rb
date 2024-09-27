
Given("I am on the new writing outlet page") do
  visit new_writing_outlet_path  # or the correct path to your form
end

When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value, visible: :all
end

When('I press {string}') do |button|
  click_button button
end

Then('I should see {string}') do |message|
  expect(page).to have_content(message)
end
