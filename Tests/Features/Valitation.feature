Feature:
  In order to to create good forms
  As a user
  I need validations working correctly

  Scenario: Put in some non-valid stuff
    Given I am on homepage
    And there are no "\Famelo\Demo\Admin\Domain\Model\Validation" entities
    When I follow "Models"
    And follow "Validation"
    Then I should see an ".t3-expose-form" element
    When I fill in "form-objects_0_email" with "Some String"
    And press "Submit"
    Then I should see "This property is required"
    And I should see "Please specify a valid email address"
    And the "form-objects_0_email" field should contain "Some String"

  Scenario: Put in some valid stuff
    Given I am on homepage
    When I follow "Models"
    And I follow "Validation"
    Then I should see an ".t3-expose-form" element
    When I fill in "form-objects_0_required" with "Some String"
    And fill in "form-objects_0_email" with "some@email.com"
    And I press "Submit"
    Then I should see an ".t3-expose-recordlist" element
    And I should see "Some String"
    And I should see "some@email.com"