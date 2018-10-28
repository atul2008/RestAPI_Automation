Feature: API Response for a Category of Business-farming-industry
  Data Retrieve from a table database
      Get the Catalogue and it's Promotional Elements

    Background: Set base url and headers
      Given a request url https://api.tmsandbox.co.nz/v1/Categories/6327/Details.json?catalogue=false
      And a request sends GET

    Scenario Outline: Get the farming categories detail
        Then the response json at <Category name> is equal to <Category_result>


      Examples: Business Farming Industry Category Data
        | Category name               | Category_result   |
        | $.Name                      | "Carbon credits"  |
        | $.CanRelist                 | True              |
        | $.Promotions[1].Name        | "Gallery"         |
        | $.Promotions[1].Description | "Good position in category \n2x larger image in desktop site search results"|


    Scenario Outline: Get the industry promotions elements Name "Gallery "has a description "2x larger image"
        Then the response json with promotional elements at <Promotional Element> is equal to <Promotional_response>

      Examples: Business Farming Industry Promotions Name and Description
        | Promotional Element                           | Promotional_response |
        | $.Promotions[@.Name is "Gallery"].Description | "Good position in category \n2x larger image in desktop site search results"|


    Scenario Outline: Get all promotions elements Name="Gallery "has a description "2x larger image"
        Then Get all Promotion element with <Promotion_Names> is <Promotion_name_value> has a <Promotion_Description> contains <Promotion_Description_Value>

      Examples: Dynamically get all Promotional element Name="Gallery" has a Description text "2x larger image"
         | Promotion_Names         | Promotion_Description       | Promotion_name_value  | Promotion_Description_Value|
         | $.Promotions[@.Name]    | $.Promotions[@.Description] | Gallery          | 2x larger image      |




