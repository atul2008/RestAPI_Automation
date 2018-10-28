Feature: Security aspects of REST API
    Turn off and on SSL certification and sends the GET request

    Background: Set base url and headers
      Given a request url https://api.tmsandbox.co.nz/v1/Categories/6327/Details.json?catalogue=false


    Scenario: # GET request without ssl validation
      Given Send untrusted GET request to base url
      Then the response status code should equal 200


    Scenario: # Turning off global SSL check
      Given Disable SSL certificate
      When a request sends GET
      Then the response status code should equal 200


    Scenario: # Turning on global SSL check
      Given Enable SSL certificate
      When a request sends GET
      Then the response status code should equal 200

