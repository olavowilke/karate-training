Feature: Get API demo

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Get demo
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

#    Get with background
  Scenario: Get demo 2
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

#    Get with background
  Scenario: Get demo 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

#    Get with assertions
  Scenario: Get demo 4
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[3].id == 10
    And match response.data[4].last_name == 'Edwards'
