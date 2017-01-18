Feature: Login feature

  Scenario Outline: As a user I can navigate to main screens in app
    Given I am on Home Screen
    When I go to "<string>" screen
    Then I can see the "<string>" screen loaded

    Examples:
      |string         |
#      |Sports         |
#      |Sky Box Sets   |
#      |Catch Up       |
#      |Sky Movies     |
#      |Kids           |
#      |On Now         |
      |Downloads      |

  @scenario1
  Scenario Outline: Download a program
    Given I go to "<string>" screen
    When I tap on an program


  Examples:
      |string         |
#      |Sports         |
      |Sky Box Sets   |
#      |Catch Up       |
#      |Sky Movies     |
#      |Kids           |
#      |On Now         |
#      |Downloads      |




  Scenario:
    Given I open the downloads notification
    When I tap the download notification
