#Author Anna V
#  This Feature is for all possible functionality of "Quiz" tab in ASK application
#teacherBP1@gmail.com
@smoke
Feature: Quiz creation functionality

    Background:
      Given I open url "http://ask-int.portnov.com/#/login"
      Then I type "teacherBP1@gmail.com" into element with xpath "//input[@formcontrolname='email']"
      Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
      And I click on element with xpath "//span[contains(text(),'Sign In')]"
      # land on Home page
      Then I wait for element with xpath "//p[contains(text(),'TEACHER')]" to be present
      Then element with xpath "//p[contains(text(),'TEACHER')]" should contain text "TEACHER"

      @functionality09
      Scenario: Create and Delete Single Choice Quiz
        #Go to Quizzes
        Then I click on element with xpath "//h5[contains(text(),'Quizzes')]"
        Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
        #create a quiz
        And I click on element with xpath "//span[contains(text(),'Create New Quiz')]"
        Then I wait for 1 sec
        #add quiz title
      Then I type "00 Anna Quiz Session 10" into element with xpath "//input[@formcontrolname='name']"
        Then I click on element with xpath " //mat-icon[contains(text(),'add_circle')]"
        #add Single Choice question
        Then element with xpath "//mat-panel-title[contains(text(),'Q1: new empty question')]" should be present
        Then I click on element with xpath "//mat-radio-button[2]"
        #fill out question and answers
        Then I type "Question text for the first question" into element with xpath "//textarea[@placeholder='Question *']"
        And I type "Answer text 1 correct" into element with xpath "//textarea[@placeholder='Option 1*']"
        And I type "Answer text 2 incorrect" into element with xpath "//textarea[@placeholder='Option 2*']"
        And I click on element with xpath "//mat-radio-group[1]/mat-radio-button[@class='mat-radio-button mat-accent']"
        And I click on element with xpath "//span[contains(text(),'Save')]"
        #go back to List of Quizzes and verify the data
        Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
        Then element with xpath "//mat-panel-title[contains(text(),'00 Anna Quiz Session 10')]" should be present
        And element with xpath "//mat-panel-title[contains(text(),'00 Anna Quiz Session 10')]" should contain text "00 Anna Quiz Session 10"
        #delete the quiz
        And I click on element with xpath "//mat-panel-title[contains(text(),'00 Anna Quiz Session 10')]"
        #click on Delete button
        And I click on element with xpath "//mat-panel-title[contains(text(),'00 Anna Quiz Session 10')]/../../..//button[@class='mat-raised-button mat-warn']"
        #verify that Confirmation menu got opened
        Then I wait for element with xpath "//h1[contains(text(),'Confirmation')]" to be present
        Then element with xpath "//h1[contains(text(),'Confirmation')]" should contain text "Confirmation"
        Then I click on element with xpath "//div[@class='mat-dialog-actions']//span[contains(text(),'Delete')]"
        #verify that the quiz is deleted
        Then I wait for 2 sec
        Then I wait for element with xpath "//h4[contains(text(),'List of Quizzes')]" to be present
        Then element with xpath "//mat-panel-title[contains(text(),'00 Anna Quiz Session 10')]" should not be present
