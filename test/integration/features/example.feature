Feature: Example Feature

  Background:
    Given I visit TODOMVC

  Scenario: Entering Information
    When I enter "dogecoins"
    Then I should see "dogecoins"

  Scenario: Completing a Todo
    When I enter "Learn Pioneer"
    And complete the first todo
    Then I should see that the first todo is completed
