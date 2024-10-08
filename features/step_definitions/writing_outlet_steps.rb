Given("a writing outlet exists") do
  @writing_outlet = FactoryBot.create(:writing_outlet)
end

Given("there are multiple writing outlets") do
  @writing_outlet1 = FactoryBot.create(:writing_outlet, title: "First Writing Outlet", content: "Content for the first outlet")
  @writing_outlet2 = FactoryBot.create(:writing_outlet, title: "Second Writing Outlet", content: "Content for the second outlet")
end

Given("I am on the {string} page") do |page_name|
  @writing_outlet ||= FactoryBot.create(:writing_outlet)
  visit path_for(page_name)
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

Given(/^(?:I am on|I go to|I visit) the {string} page$/) do |page_name|
  visit path_for(page_name)
end

Then("I should see a list of writing outlets") do
  # Check that the titles of the writing outlets are displayed on the index page
  expect(page).to have_content(@writing_outlet1.title)
  expect(page).to have_content(@writing_outlet2.title)
end
