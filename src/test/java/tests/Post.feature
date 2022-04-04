Feature: Post API Demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read("response1.json")

    # Simple Post Request
  Scenario: Post Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And print response

    # Post With Background
  Scenario: Post Demo 2
    Given path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And print response

    # Post With Assertions
  Scenario: Post Demo 3
    Given path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And match response == {"name": "morpheus","job": "leader","id": "#string","createdAt": "#ignore"}

    # Post with read response from file
  Scenario: Post Demo 4
    Given path '/users'
    And request {"name": "morpheus","job": "leader"}
    When method POST
    Then status 201
    And match response == expectedOutput

    # Post with request body from file
  Scenario: Post Demo 5
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And def filePath = projectPath+'/src/test/java/data/request1.json'
    And def requestBody = filePath
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput

    # Post with request body from file
  Scenario: Post Demo 6
    Given path '/users'
    And def requestBody = read("request2.json")
    And set requestBody.job = 'engineer'
    And request requestBody
    When method POST
    Then status 201
    And match response != expectedOutput