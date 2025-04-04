Feature: Author Sign Up
  Scenario: Author can sign up with valid credentials
    Given I am on the sign up page
    When I fill in the sign-up form with valid details

Feature: Author Login and Logout
  Scenario: Author can sign up with valid credentials
    Given I have signed up successfully
    When I click on the log in button
    Then  I should see "Signed out successfully."

