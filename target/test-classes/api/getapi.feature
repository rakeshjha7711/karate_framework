Feature: Testing GET API

  Background:
    * url 'https://dummy.restapiexample.com'

  Scenario: Verify successful GET request
    Given path '/api/v1/employees'
    When method GET
    Then status 200

    And match response.data[0].employee_name == 'Tiger Nixon'
    And match response.data[1].employee_name == 'Garrett Winters'
    And match response.data[2].employee_name == 'Ashton Cox'
    #And match response.data[0] == { employee_name: '#string' }

    And print 'Employee Name:', response.data[0].employee_name
    And print 'Employee Name:', response.data[1].employee_name
    And print 'Employee Name:', response.data[2].employee_name
