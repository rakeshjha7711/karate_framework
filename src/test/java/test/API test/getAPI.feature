Feature: Large GET API Response Test

  Background:
    * url 'https://api.example.com'  # Replace with your API URL

  Scenario: Retrieve and validate a large list of items
    Given path '/items'
    When method GET
    Then status 200
    And match response contains {
    items: '#notnull',
    total: '#number'
    }
    And match karate.sizeOf(response.items) > 0

  Scenario Outline: Validate individual items in the response
    Given path '/items/<item_id>'
    When method GET
    Then status 200
    And match response == <expected_item_data>

    Examples:
      | item_id | expected_item_data             |
      | 1       | { id: 1, name: 'Item 1', ... } |
      | 2       | { id: 2, name: 'Item 2', ... } |
      | 3       | { id: 3, name: 'Item 3', ... } |
      | 4       | { id: 4, name: 'Item 4', ... } |
      | 5       | { id: 5, name: 'Item 5', ... } |
  # Add more examples as needed for specific items

  Scenario: Validate pagination
    Given path '/items?page=2&pageSize=10'  # Adjust query parameters as needed
    When method GET
    Then status 200
    And match response contains {
    items: '#notnull',
    total: '#number',
    page: 2,
    pageSize: 10
    }
    And match karate.sizeOf(response.items) == 10  # Adjust based on pageSize
