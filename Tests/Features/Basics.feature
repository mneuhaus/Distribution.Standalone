Feature:
  In order to work with expose
  As a user
  I need to be able to create, update, list and delete entities

  Scenario: Before we start, we need to reset the database
    Given I am on homepage
    When I follow "Helper"
    When I follow "Clear Database"

  Scenario: At first i should be redirect to the new form
    Given I am on homepage
    When I follow "Models"
    When I follow "Adresses"
    Then I should see an ".t3-expose-form" element
    When I fill in "form-objects_0_street" with "Foo"
    When I press "Submit"
    Then I should see an ".t3-expose-recordlist" element
    Then I should see "Foo"

  Scenario: Create a address
    Given I am on homepage
    When I follow "Models"
    When I follow "Adresses"
    When I follow "New"
    Then I should see an ".t3-expose-form" element
    When I fill in "form-objects_0_street" with "My-cool-street"
    When I press "Submit"
    Then I should see an ".t3-expose-recordlist" element
    Then I should see "My-cool-street"

  Scenario: Edit that address
    Given I am on homepage
    When I follow "Models"
    When I follow "Adresses"
    When I click "Edit" on a "tr" which contains "My-cool-street"
    When I fill in "form-objects_0_street" with "My-cool-other-street"
    When I press "Submit"
    Then I should see an ".t3-expose-recordlist" element
    Then I should see "My-cool-other-street"

  Scenario: I'm not really sure if i want to delete that address
    Given I am on homepage
    When I follow "Models"
    Then I follow "Adresses"
    When I click "Delete" on a "tr" which contains "My-cool-other-street"
    Then I should see "Are you sure"
    When I follow "Cancel"
    Then I should see an ".t3-expose-recordlist" element
    Then I should see "My-cool-other-street"

  Scenario: Now really delete that address
    Given I am on homepage
    When I follow "Models"
    Then I follow "Adresses"
    When I click "Delete" on a "tr" which contains "My-cool-other-street"
    Then I should see "Are you sure"
    When I follow "Delete"
    Then I should see an ".t3-expose-recordlist" element
    Then I should not see "My-cool-other-street"