# Rest API Automation using Behave (behave)

[![Build Status](https://github.com/atul2008/RestAPI_Automation/tree/master/)](https://github.com/atul2008/RestAPI_Automation/tree/master/RestAPI_Automation)

Behave is a Behavior Driven Development (BDD) framework based on 
[behave](https://behave.readthedocs.io/en/latest/), that implements a language suitable 
to test and validate REST APIs and Services. It leverages the power of the 
[gherkin](https://docs.cucumber.io/gherkin/reference/) language to write 
business readable tests that validate the behavior of REST APIs.

Behave is implemented in [python](http://www.python.org) and 
uses [behave](https://github.com/behave/behave) as underlying framework, it can 
test services implemented in any language as easy as.

Reporting is implemented using [allure framework](https://docs.qameta.io/allure/), it provides a support
for continuous integration [Jenkins](https://docs.qameta.io/allure/#_jenkins) and customization of reports based on the 
business users need.


```gherkin
Feature: Carbon Credits Schema Validation
  Validates the functionality of the provided schema against "the response json matches"

    Background: Set base url and headers
      Given a request url https://api.tmsandbox.co.nz/v1/Categories/6327/Details.json?catalogue=false
      And a request sends GET

    Scenario: Validates the response against specified schema
      Then the response json matches with the business farming industry name carbon credits schema
            """
            {
                "$schema": "http://json-schema.org/draft-04/schema#",
                "type": "object",
                "properties": {
                  "CategoryId": {
                    "type": "integer"
                  },
                  "Name": {
                    "type": "string"
                  },
                  "Path": {
                    "type": "string"
                  },
                  "CanListAuctions": {
                    "type": "boolean"
                  },
                  "CanListClassifieds": {
                    "type": "boolean"
                  },
                  "CanRelist": {
                    "type": "boolean"
                  },
                  "LegalNotice": {
                    "type": "string"
                  },
                  "DefaultDuration": {
                    "type": "integer"
                  },
                  "AllowedDurations": {
                    "type": "array",
                    "items": [
                      {
                        "type": "integer"
                      },
                      {
                        "type": "integer"
                      },
                      {
                        "type": "integer"
                      },
                      {
                        "type": "integer"
                      },
                      {
                        "type": "integer"
                      },
                      {
                        "type": "integer"
                      },
                      {
                        "type": "integer"
                      },
                      {
                        "type": "integer"
                      }
                    ]
                  },
                  "Fees": {
                    "type": "object",
                    "properties": {
                      "Bundle": {
                        "type": "number"
                      },
                      "EndDate": {
                        "type": "number"
                      },
                      "Feature": {
                        "type": "number"
                      },
                      "Gallery": {
                        "type": "number"
                      },
                      "Listing": {
                        "type": "number"
                      },
                      "Reserve": {
                        "type": "number"
                      },
                      "Subtitle": {
                        "type": "number"
                      },
                      "TenDays": {
                        "type": "number"
                      },
                      "ListingFeeTiers": {
                        "type": "array",
                        "items": [
                          {
                            "type": "object",
                            "properties": {
                              "MinimumTierPrice": {
                                "type": "integer"
                              },
                              "FixedFee": {
                                "type": "number"
                              }
                            },
                            "required": [
                              "MinimumTierPrice",
                              "FixedFee"
                            ]
                          }
                        ]
                      },
                      "SecondCategory": {
                        "type": "number"
                      }
                    },
                    "required": [
                      "Bundle",
                      "EndDate",
                      "Feature",
                      "Gallery",
                      "Listing",
                      "Reserve",
                      "Subtitle",
                      "TenDays",
                      "ListingFeeTiers",
                      "SecondCategory"
                    ]
                  },
                  "FreePhotoCount": {
                    "type": "integer"
                  },
                  "MaximumPhotoCount": {
                    "type": "integer"
                  },
                  "IsFreeToRelist": {
                    "type": "boolean"
                  },
                  "Promotions": {
                    "type": "array",
                    "items": [
                      {
                        "type": "object",
                        "properties": {
                          "Id": {
                            "type": "integer"
                          },
                          "Name": {
                            "type": "string"
                          },
                          "Description": {
                            "type": "string"
                          },
                          "Price": {
                            "type": "number"
                          },
                          "MinimumPhotoCount": {
                            "type": "integer"
                          }
                        },
                        "required": [
                          "Id",
                          "Name",
                          "Description",
                          "Price",
                          "MinimumPhotoCount"
                        ]
                      },
                      {
                        "type": "object",
                        "properties": {
                          "Id": {
                            "type": "integer"
                          },
                          "Name": {
                            "type": "string"
                          },
                          "Description": {
                            "type": "string"
                          },
                          "Price": {
                            "type": "number"
                          },
                          "OriginalPrice": {
                            "type": "number"
                          },
                          "MinimumPhotoCount": {
                            "type": "integer"
                          }
                        },
                        "required": [
                          "Id",
                          "Name",
                          "Description",
                          "Price",
                          "OriginalPrice",
                          "MinimumPhotoCount"
                        ]
                      },
                      {
                        "type": "object",
                        "properties": {
                          "Id": {
                            "type": "integer"
                          },
                          "Name": {
                            "type": "string"
                          },
                          "Description": {
                            "type": "string"
                          },
                          "Price": {
                            "type": "number"
                          },
                          "OriginalPrice": {
                            "type": "number"
                          },
                          "Recommended": {
                            "type": "boolean"
                          },
                          "MinimumPhotoCount": {
                            "type": "integer"
                          }
                        },
                        "required": [
                          "Id",
                          "Name",
                          "Description",
                          "Price",
                          "OriginalPrice",
                          "Recommended",
                          "MinimumPhotoCount"
                        ]
                      },
                      {
                        "type": "object",
                        "properties": {
                          "Id": {
                            "type": "integer"
                          },
                          "Name": {
                            "type": "string"
                          },
                          "Description": {
                            "type": "string"
                          },
                          "Price": {
                            "type": "number"
                          },
                          "OriginalPrice": {
                            "type": "number"
                          },
                          "MinimumPhotoCount": {
                            "type": "integer"
                          }
                        },
                        "required": [
                          "Id",
                          "Name",
                          "Description",
                          "Price",
                          "OriginalPrice",
                          "MinimumPhotoCount"
                        ]
                      }
                    ]
                  },
                  "EmbeddedContentOptions": {
                    "type": "array",
                    "items": {}
                  },
                  "MaximumTitleLength": {
                    "type": "integer"
                  },
                  "AreaOfBusiness": {
                    "type": "integer"
                  },
                  "DefaultRelistDuration": {
                    "type": "integer"
                  }
                },
                "required": [
                  "CategoryId",
                  "Name",
                  "Path",
                  "CanListAuctions",
                  "CanListClassifieds",
                  "CanRelist",
                  "LegalNotice",
                  "DefaultDuration",
                  "AllowedDurations",
                  "Fees",
                  "FreePhotoCount",
                  "MaximumPhotoCount",
                  "IsFreeToRelist",
                  "Promotions",
                  "EmbeddedContentOptions",
                  "MaximumTitleLength",
                  "AreaOfBusiness",
                  "DefaultRelistDuration"
                ]
              }
            """
```

```gherkin
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
```


As you can see in the example, we send a GET request to the specified url , 
and we can validate the result very easy. First, we validate the
response JSON body using the expected [JSON Schema](http://json-schema.org/). 
Finally, we validate specific values in the response using 
[ObjectPath](http://objectpath.org/tutorial.html).


__**SETUP CONFIGURATION AND USAGE GUIDE **__

`Note`: 
-       Tested and Verified with macOS High Sierra Version 10.13.6
- Pull project from Git hub: 
-       https://github.com/atul2008/RestAPI_Automation.git
- Install Python 3.7.0
- Install 'pip3'
- Install Java 1.8.0_181
- Install brew:
-       /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
- Install allure:
-       brew install allure 
- Install requirements.txt 
-       pip install -r requirements.txt
- Run from root directory cd RestAPI_Automation : '/RestAPI_Automation/run_features.py'
 -      python3 run_features.py