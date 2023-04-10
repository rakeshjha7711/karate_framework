Feature: process payment api testing to check error message validation

  Background:
    #* def functions = read('jwttoken.js')
    * def Authorization = call read('basic_auth.js') { mobileNumber: '918722000003', deviceId: '9F0D7162-F90E-41B7-8357-88891C33F0ED'}

    * def requestPayload =
    

"""
{
  "mobileNumber": "+918722000003",
  "deviceId": "9F0D7162-F90E-41B7-8357-88891C33F0ED",
}
"""
  Scenario: Testing a POST api of process payment
  Given url baseurl+'/api/v1/bnpl/processPayment'
  And request requestPayload
  And header Content-Type = 'application/json'
  
  And header Authorization = '' //write token form json file
  And header TENANT = 'KOTAK_BNPL'
  And header public-key = 'Bearer cGtfbGl2ZV94NjIzRkpNZmFJbmk6c2tfbGl2ZV9xeUVwSUJaQWQxcG1aNk9oMklUOG43UjlmSzFVbmM2aEQ3VGtHSUxy'
  And header User-Agent = 'PostmanRuntime/7.31.1'
  When method POST
  Then status 200
  And match $.result.status == 'failed'
  And match $.result.statusCode == 'PAY_1002'
  And match $.result.message == 'Request expired.'
  * print response

  
  