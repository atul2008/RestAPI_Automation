Feature: API Response for a Category of Business-farming-industry
    Validates the functionality of the Catalogue and it's Promotional Elements

    Background: Set base url and headers
      Given a request url https://api.tmsandbox.co.nz/v1/Categories/6327/Details.json?catalogue=false
      And a request sends GET


    Scenario: Validates carbon credits category and its promotions elements properties
      Then the response json at $.Name is equal to "Carbon credits"
      Then the response json at $.CanRelist is equal to True
      Then the response json at $.Promotions[1].Name is equal to "Gallery"
      Then the response json at $.Promotions[1].Description is equal to "Good position in category \n2x larger image in desktop site search results"

    Scenario: Validates Promotional element Name="Gallery" has a Description text "2x larger image" with object path
      Then the response json with promotional elements at $.Promotions[@.Name is "Gallery"].Description is equal to "Good position in category \n2x larger image in desktop site search results"

    Scenario: Dynamically validates Promotional element Name="Gallery" has a Description text "2x larger image"
        Then Get all Promotion element with $.Promotions[@.Name] is Gallery has a $.Promotions[@.Description] contains 2x larger image



