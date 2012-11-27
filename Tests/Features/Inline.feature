Feature:
	In order to work with complex object relations
	As a user
	I need to be able to edit related objects inline

	Scenario: Create an inline item with adresses
		Given I am on homepage
		And there are no "\Famelo\Demo\Admin\Domain\Model\Inline" entities
		When I follow "Models"
		And follow "Inline"
		Then I should see an ".t3-expose-form" element
		When I fill in "form-objects_0_addressStacked_street" with "stacked-value"
		And fill in "form-objects_0_addressTabular_street" with "tabular-value"
		And fill in "form-objects_0_addressSeamless_street" with "seamless-value"
		And fill in "form-objects_0_addressesStacked_0_street" with "multi-stacked-value"
		And fill in "form-objects_0_addressesTabular_0_street" with "multi-tabular-value"
		And fill in "form-objects_0_addressesSeamless_0_street" with "multi-seamless-value"
		And press "Submit"
		Then I should see an ".t3-expose-recordlist" element
		And I should see "stacked-value"
		And I should see "tabular-value"
		And I should see "seamless-value"
		And I should see "multi-stacked-value"
		And I should see "multi-tabular-value"
		And I should see "multi-seamless-value"

	Scenario: Let's edit an inline item
		Given I am on homepage
		When I follow "Models"
		And follow "Inline"
		And click "Edit" on a "tr" which contains "multi-stacked-value"
		Then I should see an ".t3-expose-form" element
		When I fill in "form-objects_0_addressStacked_street" with "stacked-value-changed"
		And I fill in "form-objects_0_addressesStacked_0_street" with "multi-stacked-value-changed"
		And press "Submit"
		Then I should see an ".t3-expose-recordlist" element
		And I should see "stacked-value-changed"
		And I should see "multi-stacked-value-changed"

	Scenario: Let's remove an item from addressesStacked
		Given I am on homepage
		When I follow "Models"
		And follow "Inline"
		And click "Edit" on a "tr" which contains "multi-stacked-value"
		Then I should see an ".t3-expose-form" element
		When click ".close" on a ".t3-expose-inline-item" which contains "multi-stacked-value"
		Then should not see "multi-stacked-value"
		When press "Submit"
		Then I should see an ".t3-expose-recordlist" element
		And should not see "multi-stacked-value"

	Scenario: Validation should work for Inline editing entities
		Given I am on homepage
		When I follow "Models"
		And follow "Inline"
		And follow "New"
		Then I should see an ".t3-expose-form" element
		And press "Submit"
		And I should see "This property is required"