Feature: User Sign Up
  Scenario: User can sign up with valid credentials
    Given I am on the sign up page
    When I fill in the email address with "test@example.com"
    And I fill in the password with "password123"
    And I click the "Sign Up" button
    Then I should be redirected to the dashboard page