Feature: process payment api testing to check error message validation

  Background:
    * url 'https://apitest.livquik.com'


    * def random_string  
    """
      function (s)
      {
        var text = "";
        var pattern = "AHGDGWUEgvsJJHGJGAJDHG"
        for (var i = 0; i<s; i++>)
        text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
        return text;
      }
    """

    * randomString = random_string(10)
    * print randomString


    * def requestPayload = 
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
  * requestPayload.merchantOrderId = requestPayload + "ABC76575676575"
  * print requestPayload
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
  And match $.result.message == 'Request expired.'
  * print response
  

  