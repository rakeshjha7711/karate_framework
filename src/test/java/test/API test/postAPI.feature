Feature: Create Task API

  Background:
    * url 'https://api.example.com'  # Replace with your API URL

  Scenario: Create a new task
    Given path '/tasks'
    And request
      """
      {
        "title": "New Task",
        "completed": false
      }
      """
    When method POST
    Then status 201
    And match response == {
"title": "New Task",
"completed": false,
"id": "#number"  # This ensures that the 'id' is a number in the response
}
