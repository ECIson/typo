Feature: See categories page
  As a blog administrator
  In order to organize my articles
  I want to be able to add and modify categories

  Scenario: See the categories page
    Given the blog is set up
    Given I am logged into the admin panel
    When I go to the categories page
    Then I should see "Categories"
