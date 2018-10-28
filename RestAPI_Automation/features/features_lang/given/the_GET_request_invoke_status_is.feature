Feature: Invoke API, To get the business farming industry catalogues details
  As a user, I want to know the API GET status


   Background: Set base url and headers
    Given a request url https://api.tmsandbox.co.nz/v1/Categories/6327/Details.json?catalogue=false
    And  API header Content-Type set 'Accept' to 'application/json'


   Scenario: To get carbon credits category detail under business farming industry
     When a request sends GET
     Then the response status code should equal 200
     And the response status message should equal OK
     And the response header Content-Type should equal application/json






