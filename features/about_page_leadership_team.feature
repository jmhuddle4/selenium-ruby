Feature: Leadership Team
  As a MailChimp site user
  I want to see the leadership team list on the about page
  So that I can save each member's info to a csv file

  Scenario Outline: Users can click on each team member item card to see full description of each team member
    Given A user navigates to the MailChimp home page
    When The user clicks on "<link>"
    Then The user should land on the about page
    And The user should see the leadership team section
    And The user should be able to see each team member's information

  Examples:
    | link      |
    | about     |