Given("I am on the sign up page") do
  visit new_author_registration_path
end

When("I fill in the sign-up form with valid details") do
  fill_in "Email", with: "test@example.com"
  fill_in "Password", with: "password123"
  fill_in "Password confirmation", with: "password123"
  click_button "Sign up"
end


Given("I have signed up successfully") do
  fill_in "Email", with: "test@example.com"
  fill_in "Password", with: "password123"
  fill_in "Password confirmation", with: "password123"
  click_button "Sign up"
end

When("I click on the log in button") do
  click_button "Log in"
end

Then("It should see 'Signed in successfully'") do
  expect(page).to have_content("Signed in successfully.")
end

