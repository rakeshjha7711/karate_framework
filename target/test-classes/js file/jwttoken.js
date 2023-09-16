

const jwt = require("jsonwebtoken");
const reqBody = {
  mobileNumber: "+918369221597",
  deviceId: "123456",
};

const secretKey = "sk_live_1IQbrlbJbsUbwECZSIesC94A6JlY2fbTnlFJu7yT";

function generateToken(reqBody, secretKey) {
  const token = jwt.sign(reqBody, secretKey, { expiresIn: 60 * 15 });
  return token;
}