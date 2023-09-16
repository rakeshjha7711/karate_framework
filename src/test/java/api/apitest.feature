Feature: Testing API

  Background:
  # Common configuration, if needed

  Scenario: Verify successful GET request
    Given url 'https://dummy.restapiexample.com'
    And path '/api/v1/employees'
    When method GET
    Then status 200
    And match response.data[0].employee_name == 'Tiger Nixon'
    And match response.data[1].employee_name == 'Garrett Winters'
    And match response.data[2].employee_name == 'Ashton Cox'
    And print 'Employee Name:', response.data[0].employee_name
    And print 'Employee Name:', response.data[1].employee_name
    And print 'Employee Name:', response.data[2].employee_name

  Scenario: Verify successful POST request
    Given url 'https://reqres.in'
    And path '/api/users'
    And request { name: 'morpheus', job: 'leader' }
    When method POST
    Then status 201

  Scenario: verify failed use cases for POST request
    Given url 'https://reqres.in'
    And path '/api/users'
    And request { name: 'morpheus', job: 'leader' }
    When method POST
    Then status 201
    * karate.log('Test cases failed')

@skipScenario
  Scenario: Veify skipped use cases
    Given url 'https://reqres.in'
    And path '/api/users'
    And request { name: 'morpheus', job: 'leader' }
    When method POST
    Then status 201
    * karate.log('Test cases skipped')
   