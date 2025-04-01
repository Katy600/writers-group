Feature: View writing on the index page
  Scenario: User views writing on the index page
    Given there are multiple writing outlets
    Given I am on the "index writing outlets" page
    Then I should see a list of writing outlets
    When I click "First Writing Outlet" link
