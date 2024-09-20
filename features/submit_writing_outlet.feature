Feature: Submit an article

  Scenario: User enters title and context and submits the article
    Given I am on the "Writing Outlet" page
    When I fill in "Title" with "My Awesome Title"
    And I fill in "Context" with "This is the context of the article."
    And I press "Submit"
    Then I should see "Article was successfully submitted"