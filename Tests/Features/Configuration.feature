Feature:
  In order to to create awesome forms
  As a developer
  I need some good configuration options

  Scenario: Before we start, we need to reset the database
    Given I am on homepage
    When I follow "Helper"
    When I follow "Clear Database"

  Scenario: The form should be customized
    Given I am on homepage
    When I follow "Models"
    When I follow "Configuration"
    Then I should see an ".t3-expose-form" element
    Then I should see "Custom Label"
    Then I should not see an "#form-objects_0_ignoreCompletly" element
    Then I should see an "#form-objects_0_ignoreListView" element
    Then I should see an "select#form-objects_0_optionsProvider" element

  Scenario: Create a new configuration element
    Given I am on homepage
    When I follow "Models"
    When I follow "Configuration"
    Then I should see an ".t3-expose-form" element
    When I fill in "form-objects_0_name" with "Some Name"
    When I fill in "form-objects_0_ignoreListView" with "Some String"
    When I select "Bar" from "form-objects_0_optionsProvider"
    Then I press "Submit"
    Then I should see an ".t3-expose-recordlist" element
    Then I should not see "Some String"
    Then I should see "Some Name"
    Then I should see "Custom Label"
    Then I should see "Bar"