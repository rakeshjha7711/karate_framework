Feature: process payment api testing to check error message validation

  Background:
    * def generateJwtToken =

"""
function generateJwtToken(payload)
{
const jwt = require('jsonwebtoken')
const reqBody = {
 mobileNumber: "+918448848902",
 deviceId: "EB57FCDE-097D-4483-8CCF-27649FFC8B2A"
};
const secret = "sk_live_ND4ehnhRk2TRz7MVPbOH4FkCUDy7elv0QP3xUVWo";
const token = jwt.sign(reqBody, secret,)
console.log(token);
}
"""


  Scenario: Generate JWT token and use it in header
   # Given def jwtToken = call generateJwtToken(payload, secretKey, expirationMillis)
   
    And header Authorization = 

    Given url 'https://apitest.livquik.com/api/v1/bnpl/processPayment'
    And header TENANT = 'KOTAK_BNPL'
    And header Content-Type = 'application/json'
    And header public-key = 'Bearer cGtfbGl2ZV94NjIzRkpNZmFJbmk6c2tfbGl2ZV9xeUVwSUJaQWQxcG1aNk9oMklUOG43UjlmSzFVbmM2aEQ3VGtHSUxy'
    And header User-Agent = 'PostmanRuntime/7.31.1'
    When method POST
    Then status 200
    And match $.result.status == 'failed'
    And match $.result.statusCode == 'PAY_1002'
    And match $.result.message == 'Invalid credentials.'
