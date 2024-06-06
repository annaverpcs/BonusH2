# Author: Anna V
# Manual Test case : Jira-12345
@smoke @regression
Feature: Student Settings Experience

  Background:
    Given I open url "http://ask-int.portnov.com/#/login"
    Then I type "studentBP5@gmail.com" into element with xpath "//input[@formcontrolname='email']"
    Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I click on element with xpath "//span[contains(text(),'Sign In')]"
      # land on Home page
    Then I wait for element with xpath "//p[contains(text(),'STUDENT')]" to be present
    Then element with xpath "//p[contains(text(),'STUDENT')]" should contain text "STUDENT"

  @smoke @featurerequest @regression
  Scenario: Student change name with 1 alphabetical word
#    Given I open url "http://ask-int.portnov.com/#/login"
#    Then I type "studentBP5@gmail.com" into element with xpath "//input[@formcontrolname='email']"
#    Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
#    And I click on element with xpath "//span[contains(text(),'Sign In')]"
#      # land on Home page
#    Then I wait for element with xpath "//p[contains(text(),'STUDENT')]" to be present
#    Then element with xpath "//p[contains(text(),'STUDENT')]" should contain text "STUDENT"
      # go to Settings page
    And I click on element with xpath "//h5[contains(text(),'Settings')]"
    Then element with xpath "//h4[contains(text(),'Settings')]" should be displayed
    Then I click on element with xpath "//span[contains(text(),'Change Your Name')]"
      #open pop up window
    Then element with xpath "//h1[text()=\"Changing User's Name\"]" should be present
    Then I clear element with xpath "//input[@formcontrolname='name']"
    And I type "Abcdef" into element with xpath "//input[@formcontrolname='name']"
    Then I click on element with xpath "//div[@class='mat-dialog-actions']/../..//span[contains(text(),'Change')]"
    Then I wait for element with xpath "//td[contains(text(),'Abcdef')]" to be present
      #verify that name had been updated
    Then element with xpath "//td[contains(text(),'Abcdef')]" should contain text "Abcdef"
    Then element with xpath "//h3[contains(text(),'Abcdef')]" should contain text "Abcdef"
  @regression
  Scenario: Student change name with 2 alphabetical words
#    Given I open url "http://ask-int.portnov.com/#/login"
#    Then I type "studentBP5@gmail.com" into element with xpath "//input[@formcontrolname='email']"
#    Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
#    And I click on element with xpath "//span[contains(text(),'Sign In')]"
#      # land on Home page
#    Then I wait for element with xpath "//p[contains(text(),'STUDENT')]" to be present
#    Then element with xpath "//p[contains(text(),'STUDENT')]" should contain text "STUDENT"
      # go to Settings page
    And I click on element with xpath "//h5[contains(text(),'Settings')]"
    Then element with xpath "//h4[contains(text(),'Settings')]" should be displayed
    Then I click on element with xpath "//span[contains(text(),'Change Your Name')]"
      #open pop up window
    Then I clear element with xpath "//input[@formcontrolname='name']"
    And I type "Abcdef Abcdef" into element with xpath "//input[@formcontrolname='name']"
    Then I click on element with xpath "//div[@class='mat-dialog-actions']/../..//span[contains(text(),'Change')]"
    Then I wait for element with xpath "//td[contains(text(),'Abcdef Abcdef')]" to be present
      #verify that name had been updated
    Then element with xpath "//td[contains(text(),'Abcdef Abcdef')]" should contain text "Abcdef Abcdef"
    Then element with xpath "//h3[contains(text(),'Abcdef Abcdef')]" should contain text "Abcdef Abcdef"

  @regression
  Scenario: Student have limit to change Name only for 1 word
#    Given I open url "http://ask-int.portnov.com/#/login"
#    Then I type "studentBP5@gmail.com" into element with xpath "//input[@formcontrolname='email']"
#    Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
#    And I click on element with xpath "//span[contains(text(),'Sign In')]"
#      # land on Home page
#    Then I wait for element with xpath "//p[contains(text(),'STUDENT')]" to be present
#    Then element with xpath "//p[contains(text(),'STUDENT')]" should contain text "STUDENT"
      # go to Settings page
    And I click on element with xpath "//h5[contains(text(),'Settings')]"
    Then element with xpath "//h4[contains(text(),'Settings')]" should be displayed
    Then I click on element with xpath "//span[contains(text(),'Change Your Name')]"
      #open pop up window
    Then I clear element with xpath "//input[@formcontrolname='name']"
    And I type "Abcdef Abcdef12345" into element with xpath "//input[@formcontrolname='name']"
    Then I click on element with xpath "//div[@class='mat-dialog-actions']/../..//span[contains(text(),'Change')]"
    #verify that error message is displayed
    Then element with xpath "//mat-error[contains(text(),'Should contain only latin characters')]" should be present
    Then element with xpath "//mat-error[contains(text(),'Should contain only latin characters')]" should contain text "Should contain only latin characters"



