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
