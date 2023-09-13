Feature: Example API Testing with Karate

  Background:
    * url 'https://dummy.apiexample.com/'

  Scenario: Verify GET request and response
    Given path '/posts/1'
    When method GET
    Then status 200
    And match response == { userId: 1, id: 1, title: 'demo', body: 'quia et suscipit\nsuscipit...' }

  Scenario: Verify POST request and response
    Given path '/posts'
    And request { userId: 1, id: 101, title: 'foo', body: 'bar' }
    When method POST
    Then status 201
    And match response == { userId: 1, id: '#number', title: 'foo', body: 'bar' }

  Scenario: Verify JSON array response
    Given path '/posts'
    When method GET
    Then status 200
    And match response contains [{ userId: 1, id: '#number', title: 'foo' }, { userId: 2, id: '#number', title: 'bar' }]

  Scenario: Verify response contains text
    Given path '/comments'
    When method GET
    Then status 200
    And match response contains 'name: "Eliseo@gardner.biz"'

  Scenario: Verify absence of a key in the response
    Given path '/posts/2'
    When method GET
    Then status 200
    And match response !contains 'userId'

  Scenario: Verify response headers
    Given path '/posts/1'
    When method GET
    Then status 200
    And match responseHeaders['Content-Type'] == 'application/json; charset=utf-8'

  Scenario: Verify response time
    Given path '/posts'
    When method GET
    Then status 200
    And match responseTime < 5000

  Scenario: Verify response array size
    Given path '/comments'
    When method GET
    Then status 200
    And match response[*].id contains 1
    And match karate.sizeOf(response) == 5
