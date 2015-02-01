@javascript
Feature: User management

Background:
  Given Admin user account
    | name  | email            |
    | Admin | admin@itrack.com |

Scenario: List of users
  Given 10 existing users
  When I visit index page
  Then I see 11 users
    And I click on name "Admin"
    Then I see user's profile page with name "Admin"

Scenario: User profile
  When I go to my profile
  Then I see name "Admin" and email "admin@itrack.com"

