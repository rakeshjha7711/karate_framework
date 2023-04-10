Feature: process payment api testing to check error message validation


  Background:
    * def jsonwebtoken = read('token.json')   //read tone from json file
    Then print jsonwebtoken.token
    * def requestPayload =

      """

      {

        "mobileNumber": "",

        "deviceId": "9F0D7162-F90E-41B7-8357-88891C33F0ED",

        "channel": "app",

        "merchantId": "uk@wad7Si",

        "amount": "60",

        "currency": "INR",

        "merchantOrderId": "KOTAK-120903534354311",

        "callbackUrl": "https://localhost:8000/api/processPayment",

        "emiSubvention": false,

        "emiTransaction": false,

        "paymentMode": {

          "bnpl": [

            {

              "paymentChannelId": "kotak_bnpl_cardless_*",

              "amount": "60"

            }

          ]

        },

        "source": "secure-2fr"

      }

      """
  Scenario: invalid mobile number
    Given url baseurl+'/api/v1/bnpl/processPayment'
    And request requestPayload
    And header Content-Type = 'application/json'

    And header Authorization = jsonwebtoken.token   //write token form json file
    And header TENANT = 'KOTAK_BNPL'
    And header public-key = 'Bearer cGtfbGl2ZV94NjIzRkpNZmFJbmk6c2tfbGl2ZV9xeUVwSUJaQWQxcG1aNk9oMklUOG43UjlmSzFVbmM2aEQ3VGtHSUxy'
    And header User-Agent = 'PostmanRuntime/7.31.1'
    When method POST
    Then status 200
    And match $.result.status == 'failed'
    And match $.result.statusCode == 'PAY_1002'
    And match $.result.message == 'Invalid credentials.'
    * print response

  Scenario: invalid deviceID

    * def request_headers = {Content-Type: 'application/json', TENENT: 'KOTAK_BNPL', public-key: 'Bearer cGtfbGl2ZV94NjIzRkpNZmFJbmk6c2tfbGl2ZV9xeUVwSUJaQWQxcG1aNk9oMklUOG43UjlmSzFVbmM2aEQ3VGtHSUxy', User-Agent: 'PostmanRuntime/7.31.1'}
    And header Authorization = jsonwebtoken.token   //write token form json file
    Given headers request_headers
    Given url baseurl+'/api/v1/bnpl/processPayment'
    And request requestPayload
    When method POST
    Then status 200
    And match $.result.status == 'failed'
    And match $.result.statusCode == 'PAY_1002'
    And match $.result.message == 'Invalid credentials.'
    * print response

