Feature: Merge Articles
  As a blog administrator
  In order to organize my articles
  I want to be able to merge two articles into one on my blog

  Background:
    Given the blog is set up

  Scenario: Not be able to merge articles as a non-admin
    Given I am not an admin
    And I make an article named "Foobar" with author "Me" and text "Foo"
    When I follow "Foobar"
    Then I should not see "Merge"

  Scenario: Should be able to merge articles as an admin
    Given I am logged into the admin panel
    And I make an article named "Foobar" with author "Me" and text "Foo"
    When I follow "Foobar"
    Then I should see "Merge"

  Scenario: The merged article should contain text from both articles
    Given I am logged into the admin panel
    And I make an article named "Foobar" with author "Me" and text "12345"
    And I make an article named "FoobarTwo" with author "Me" and text "67890"
    And I follow "Foobar"
    When I fill in "merge_with" with "4"
    When I press "Merge"
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "12345"
    And I should see "67890"

