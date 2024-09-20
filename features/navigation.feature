Feature: Navigation to another page

  Scenario: User clicks on Start Writing link is taken to the writing page
    Given I am on the homepage
    When I click on "Start Writing" link
    Then I should be on the "Start Writing" page