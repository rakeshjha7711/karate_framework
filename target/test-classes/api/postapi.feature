Feature: Testing POST API

  Background:
    * url 'https://reqres.in'

  Scenario: Verify successful POST request
    Given path '/api/users'
    And request { name: 'morpheus', job: 'leader' }
    When method POST
    Then status 201
    And match response == {
      "name": "morpheus",
      "job": "leader",
      "id": "#number",
      "createdAt": "#string"
    }

