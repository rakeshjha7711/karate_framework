Feature: process payment api testing to check error message validation


  Background:
    * url 'https://apitest.livquik.com'
    * def requestPayload =
    * def jwttoken = read('classpath:/home/livquik/Desktop/karate_demo/myproject/token.json')

  """
      {
  "mobileNumber": "+918722000003",
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
        "bnpl": [{
            "paymentChannelId": "kotak_bnpl_cardless_*",
            "amount":"60"
        }]
    },
    
  "source": "secure-2fr"

      }


  """
  Scenario: Testing a POST api of process payment
  Given path '/api/v1/bnpl/processPayment'
  And request requestPayload
  And header Content-Type = 'application/json'
  And header Authorization = 'jwttoken'
  And header TENANT = 'KOTAK_BNPL'
  And header public-key = 'Bearer cGtfbGl2ZV94NjIzRkpNZmFJbmk6c2tfbGl2ZV9xeUVwSUJaQWQxcG1aNk9oMklUOG43UjlmSzFVbmM2aEQ3VGtHSUxy'
  And header User-Agent = 'PostmanRuntime/7.31.1'
  When method POST
  Then status 200
  And match $.result.status == 'failed'
  And match $.result.statusCode == 'PAY_1002'
  And match $.result.message == 'Request expired.'
  * print response
  
/home/livquik/Desktop/karate_demo/myproject/token.json
  