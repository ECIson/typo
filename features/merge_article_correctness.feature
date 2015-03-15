Feature: Merge Articles
  As a blog administrator
  In order to organize my articles
  I want to be able to merge two articles into one on my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And I make an article named "Foobar" with author "Me"
    And I make an article named "FoobarTwo" with author "SomeoneElse"
    And article "Foobar" is merged with "FoobarTwo"

  Scenario: The merged article should only have one author
    When I go to the home page
    And I follow "Foobar"
    Then I should see "Me"
    But I should not see "SomeoneElse"

  Scenario: The comments should carry over to the new article
    When I go to the home page
    And I follow "Foobar"
    Then I should see comments from "Foobar"
    And I should see comments from "FoobarTwo"

  Scenario: The title is from one of the two articles
    When I go to the home page
    And I follow "Foobar"
    Then I should see "Foobar"
    But I should not see "FoobarTwo"
