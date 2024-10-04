Feature: Navigation to another page

  Scenario: User clicks on Start Writing link is taken to the writing page
    Given I am on the "Home" page
    When I click on "Start Writing" link
    Then I am on the "show writing outlet" page
    When I click on "Your Writing" link
    Then I am on the "index writing outlets" page