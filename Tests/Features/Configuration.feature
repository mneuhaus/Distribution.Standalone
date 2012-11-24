Feature:
  In order to to create awesome forms
  As a developer
  I need some good configuration options

  Scenario: The form should be customized
    Given I am on homepage
    And there are no "\Famelo\Demo\Admin\Domain\Model\Configurations" entities
    And follow "Models"
    And follow "Configuration"
    Then I should see an ".t3-expose-form" element
    And should see "Custom Label"
    And should not see an "#form-objects_0_ignoreCompletly" element
    And should see an "#form-objects_0_ignoreListView" element
    And should see an "select#form-objects_0_optionsProvider" element

  Scenario: Create a new configuration element
    Given I am on homepage
    And follow "Models"
    And follow "Configuration"
    Then I should see an ".t3-expose-form" element
    When I fill in "form-objects_0_name" with "Some Name"
    And fill in "form-objects_0_ignoreListView" with "Some String"
    And select "Bar" from "form-objects_0_optionsProvider"
    And press "Submit"
    Then I should see an ".t3-expose-recordlist" element
    And should not see "Some String"
    And should see "Some Name"
    And should see "Custom Label"
    And should see "Bar"