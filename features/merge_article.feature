Feature: Merge Articles
  As a blog administrator
  In order to organize my articles
  I want to be able to merge two articles into one on my blog

  Scenario: Not be able to merge articles as a non-admin
    Given the blog is set up
    And I am not an admin
    And an article named "Foobar" exists
    When I go to the home page
    And I follow "Foobar"
    Then I should not see a "Merge With This Article" button

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And an article named "Foobar" with ID "5" and author "Tom" exists
    And an article named "FoobarTwo" with ID "6" and author "Frank" exists

  Scenario: The merged article should contain text from both articles
    When I go to the home page
    And I follow "Foobar"
    And I press "Merge With This Article"
    And I fill in the "ID" field with "6"
    And I press "Merge"
    Then I should see text from "Foobar"
    And I should see text from "FoobarTwo"

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And an article named "Foobar" with ID "5" and author "Tom" exists
    And an article named "FoobarTwo" with ID "6" and author "Frank" exists
    And article "Foobar" is merged with "FoobarTwo"

  Scenario: The merged article should only have one author
    When I go to the home page
    And I follow "Foobar"
    Then I should see "Tom"
    But I should not see "Frank"

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
