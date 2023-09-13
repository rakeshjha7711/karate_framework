Feature: Load Testing Example

  Background:
    * url 'https://api.example.com'

  Scenario: Load Test Scenario
    Given path '/endpoint'
    And request { "key": "value" }
    When method POST
    Then status 200
