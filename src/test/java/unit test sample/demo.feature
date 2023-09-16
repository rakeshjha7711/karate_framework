Feature: Task API Testing

  Background:
    * url 'http://localhost:8080'  # Set the base URL for your API

  Scenario: Retrieve all tasks
    Given path '/tasks'
    When method GET
    Then status 200
    And match response == [{ id: '#number', title: 'Task 1', completed: false }, { id: '#number', title: 'Task 2', completed: true }]

  Scenario: Create a new task
    Given path '/tasks'
    And request { title: 'New Task', completed: false }
    When method POST
    Then status 201
    And match response == { id: '#number', title: 'New Task', completed: false }

  Scenario: Retrieve a specific task
    Given path '/tasks/1'  # Assuming you have a task with ID 1
    When method GET
    Then status 200
    And match response == { id: 1, title: 'Task 1', completed: false }

  Scenario: Update a task
    Given path '/tasks/1'  # Assuming you have a task with ID 1
    And request { title: 'Updated Task', completed: true }
    When method PUT
    Then status 200
    And match response == { id: 1, title: 'Updated Task', completed: true }

  Scenario: Delete a task
    Given path '/tasks/2'  # Assuming you have a task with ID 2
    When method DELETE
    Then status 204
