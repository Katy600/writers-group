Given(" I am on the sign up page") do
  visit path_for(new_author_session_path)
end

When("I fill in the email address with 'test@example.com'") do
  fill_in 'author[email]', with: 'test@example.com'
end

And("I fill in the password with 'password'") do
  fill_in 'author[password]', with: 'password'
end

And("I click on the sign up button") do
  click_button 'Sign up'
end

Then("I should be redirected to the dashboard page") do

end


