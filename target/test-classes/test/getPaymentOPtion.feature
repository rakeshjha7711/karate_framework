Feature: process payment api to check error message verification

  Background:
    * url 'https://apitest.livquik.com'


    * def requestPayload = 
  """
      {
  "mobileNumber":"+917304432147",
    "deviceId":"12345678",
    "merchantId": "fzAMJrXcr",
    "paymentChannelId":"kotak_bnpl_cardless_*",
    "channel":"app",
    "otp":"{{otp}}",
    "source": "secure-2fr",
    "amount":"2500"

      }


  """
  Scenario: Testing a POST api of process payment
  Given path '/api/v1/bnpl/processPayment'
  And request requestPayload
  And header Content-Type = 'application/json'
  And header Authorization = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGVOdW1iZXIiOiIrOTE4NzIyMDAwMDAzIiwiZGV2aWNlSWQiOiI5RjBENzE2Mi1GOTBFLTQxQjctODM1Ny04ODg5MUMzM0YwRUQiLCJjaGFubmVsIjoiYXBwIiwibWVyY2hhbnRJZCI6InVrQHdhZDdTaSIsImFtb3VudCI6IjYwIiwiY3VycmVuY3kiOiJJTlIiLCJtZXJjaGFudE9yZGVySWQiOiJLT1RBSy0xMjA5MDM1MzQzNTQzMTEiLCJjYWxsYmFja1VybCI6Imh0dHBzOi8vbG9jYWxob3N0OjgwMDAvYXBpL3Byb2Nlc3NQYXltZW50IiwiZW1pU3VidmVudGlvbiI6ZmFsc2UsImVtaVRyYW5zYWN0aW9uIjpmYWxzZSwicGF5bWVudE1vZGUiOnsiYm5wbCI6W3sicGF5bWVudENoYW5uZWxJZCI6ImtvdGFrX2JucGxfY2FyZGxlc3NfKiIsImFtb3VudCI6IjYwIn1dfSwic291cmNlIjoic2VjdXJlLTJmciIsImlhdCI6MTY3NjU0NjI0MCwiZXhwIjoxNjc2NTQ3MTQwfQ.YJVpqqoXhNK6qvn5RQbJE-GX02Zve7vcc9FUKqc0_W0'
  And header TENANT = 'KOTAK_BNPL'
  And header public-key = 'Bearer cGtfbGl2ZV94NjIzRkpNZmFJbmk6c2tfbGl2ZV9xeUVwSUJaQWQxcG1aNk9oMklUOG43UjlmSzFVbmM2aEQ3VGtHSUxy'
  And header User-Agent = 'PostmanRuntime/7.31.1'
  
  When method POST
  Then status 200
  And match $.result.status == 'failed'
  And match $.result.statusCode == 'PAY_1002'
  And match $.result.message == 'Invalid credentials.'
  * print response
  

  