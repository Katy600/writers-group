Feature: Submit a piece of writing

  Scenario: User enters title and content and submits a piece of writing
    Given I am on the new writing outlet page
    When I fill in "Title" with "My Awesome Title"
    And I fill in "Off load creativity here..." with "This is the content of my outlet."
    And I press "Submit"