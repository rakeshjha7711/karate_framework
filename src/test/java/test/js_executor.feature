Feature: Execute js file
Scenario: execute java script file using feature file

 # javascript (will be evaluated)
#karate.call("Desktop/myproject/karate_demo/src/test/java/test")
* def generateToken =
"""
const jwt = require("jsonwebtoken");
const fs = require('fs');

const reqBody = {
  mobileNumber: "+918369221597",
  deviceId: "123456",
  channel: "app",
  merchantId: "fzAMJrXcr",
  amount: "1000",
  currency: "INR"
};

const secretKey = "sk_live_1IQbrlbJbsUbwECZSIesC94A6JlY2fbTnlFJu7yT";

function generateToken(reqBody, secretKey) {
  const token = jwt.sign(reqBody, secretKey, { expiresIn: 60 * 15 });
  return token;
}

const token = generateToken(reqBody, secretKey);
try {
  fs.writeFileSync('token.json', JSON.stringify({ token: token })
);
  // file written successfully
} catch (err) {
  console.error(err);
}
"""





  
  