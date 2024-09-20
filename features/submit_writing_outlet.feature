Feature: Submit a piece of writing

  Scenario: User enters title and context and submits a piece of writing
    Given I am on the writing outlet page
    When I fill in "Title" with "My Awesome Title"
    And I fill in "Context" with "This is the context of my oulet."
    And I press "Submit"
    Then I should see "Your outlet was successfully submitted"