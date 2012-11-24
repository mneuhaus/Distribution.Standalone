Feature:
	In order to work with expose
	As a user
	I need to be able to create, update, list and delete entities

	Scenario: At first i should be redirect to the new form
		Given I am on homepage
		And there are no "\Famelo\Demo\Admin\Domain\Model\Address" entities
		When I follow "Models"
		And follow "Adresses"
		Then I should see an ".t3-expose-form" element
		When I fill in "form-objects_0_street" with "Foo"
		And press "Submit"
		Then I should see an ".t3-expose-recordlist" element
		And I should see "Foo"

	Scenario: Create a address
		Given I am on homepage
		When I follow "Models"
		And follow "Adresses"
		And follow "New"
		Then I should see an ".t3-expose-form" element
		When I fill in "form-objects_0_street" with "My-cool-street"
		And press "Submit"
		Then I should see an ".t3-expose-recordlist" element
		And I should see "My-cool-street"

	Scenario: Edit that address
		Given I am on homepage
		When I follow "Models"
		And follow "Adresses"
		And click "Edit" on a "tr" which contains "My-cool-street"
		And fill in "form-objects_0_street" with "My-cool-other-street"
		And press "Submit"
		Then I should see an ".t3-expose-recordlist" element
		And I should see "My-cool-other-street"

	Scenario: I'm not really sure if i want to delete that address
		Given I am on homepage
		When I follow "Models"
		And follow "Adresses"
		And click "Delete" on a "tr" which contains "My-cool-other-street"
		Then I should see "Are you sure"
		When I follow "Cancel"
		Then I should see an ".t3-expose-recordlist" element
		And I should see "My-cool-other-street"

	Scenario: Now really delete that address
		Given I am on homepage
		When I follow "Models"
		And follow "Adresses"
		And click "Delete" on a "tr" which contains "My-cool-other-street"
		Then I should see "Are you sure"
		When I follow "Delete"
		Then I should see an ".t3-expose-recordlist" element
		And I should not see "My-cool-other-street"

	Scenario: Deleting the last address should take me back to the new form
		Given I am on homepage
		When I follow "Models"
		And follow "Adresses"
		And click "Delete" on a "tr" which contains "Foo"
		When I follow "Delete"
		Then I should see an ".t3-expose-form" element