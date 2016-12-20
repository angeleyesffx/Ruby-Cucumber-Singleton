# language: en
Feature: Register in Youse System

  Scenario Outline: Register Functionality
    Given an user navigates to Youse website
    And user navigates to Minha Conta link
    And click on Cadastre-se link
    When user fill in the form with an <name> <email> <password> <confirmpass>
    Then My Account page should be displayed

    Examples:
      | name     | email              | password   | confirmpass   |
      | Test_Pri | pri_test1@gmail.com | 12345678   | 12345678      |


