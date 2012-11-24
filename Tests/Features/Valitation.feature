Feature:
  In order to to create good forms
  As a user
  I need validations working correctly

  Scenario: Before we start, we need to reset the database
    Given I am on homepage
    When I follow "Helper"
    When I follow "Clear Database"

  Scenario: Put in some non-valid stuff
    Given I am on homepage
    When I follow "Models"
    When I follow "Validation"
    Then I should see an ".t3-expose-form" element
    When I fill in "form-objects_0_email" with "Some String"
    When I press "Submit"
    Then I should see "This property is required"
    Then I should see "Please specify a valid email address"
    Then the "form-objects_0_email" field should contain "Some String"

  Scenario: Put in some valid stuff
    Given I am on homepage
    When I follow "Models"
    When I follow "Validation"
    Then I should see an ".t3-expose-form" element
    When I fill in "form-objects_0_required" with "Some String"
    When I fill in "form-objects_0_email" with "some@email.com"
    When I press "Submit"
    Then I should see an ".t3-expose-recordlist" element
    Then I should see "Some String"
    Then I should see "some@email.com"