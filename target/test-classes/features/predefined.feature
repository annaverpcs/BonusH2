@predefined
Feature: Smoke steps

  @predefined1
  Scenario: Predefined steps for Google
    Given I open url "https://google.com"
    Then I should see page title as "Google"
    Then element with xpath "//*[@name='q']" should be present
    When I type "Cucumber" into element with xpath "//*[@name='q']"
    Then I click on element using JavaScript with xpath "(//input[@name='btnK'])[1]"
    Then I wait for element with xpath "//*[@id='res']" to be present
    Then element with xpath "//*[@id='res']" should contain text "Cucumber"

    Scenario: Student Registration
      Given I open url "http://ask-int.portnov.com/#/registration"
      Then element with xpath "//h4[contains(text(),'Registration')]" should contain text "Registration"
      Then I type "Anna" into element with xpath "//input[@formcontrolname='firstName']"
      And I type "LastName" into element with xpath "//input[@formcontrolname='lastName']"
      Then I type "1234@abracadabra.com" into element with xpath "//input[@formcontrolname='email']"
      And I type "12345" into element with xpath "//input[@formcontrolname='group']"
      Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
      And I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"
      Then I click on element with xpath "//button[@type='submit']"
      # Wait for Registration confirmation page to be loaded
      Then I wait for element with xpath "//h4[contains(text(),'You have been Registered.')]" to be present
      # Verification on Registration Confirmation page
      Then element with xpath "//h4[contains(text(),'You have been Registered.')]" should contain text "You have been Registered"


  Scenario: Incorrect First Name in Student Registration
    Given I open url "http://ask-int.portnov.com/#/registration"
    Then element with xpath "//h4[contains(text(),'Registration')]" should contain text "Registration"
    # leave First Name textfield empty
    And I type "LastName" into element with xpath "//input[@formcontrolname='lastName']"
    Then I type "12345@abracadabra.com" into element with xpath "//input[@formcontrolname='email']"
    And I type "12345" into element with xpath "//input[@formcontrolname='group']"
    Then I type "12345" into element with xpath "//input[@formcontrolname='password']"
    And I type "12345" into element with xpath "//input[@formcontrolname='confirmPassword']"
    Then I click on element with xpath "//button[@type='submit']"
    Then element with xpath "//input[@placeholder='First Name']/ancestor::mat-form-field/div[1]/..//mat-error[contains(text(),'This field is required')]" should contain text "This field is required"
    And I wait for 5 sec