Feature: process payment api testing to check error message validation


  Background:
    * def jsonwebtoken = read('token.json')   //read tone from json file
    Then print jsonwebtoken.token             
    * url 'https://apitest.livquik.com'
    * def requestPayload =
# * def token = 'token.json'
# * print token

#Examples:
#| read('classpath:test/' +token) |
#var token = read('classpath:token.json' );
#* def token = read('../token.json')
 # Then print "Function name =>" , token()

#* def getRandomValue = function() {return math.floor((10) * math.random());}
 #Then print "Function name =>" , getRandomValue()

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
  
  