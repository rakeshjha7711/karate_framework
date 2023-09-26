const jwt = require("jsonwebtoken");
const fs = require('fs');

const reqBody = {
  mobileNumber: "+917715000178",
  deviceId: "123456",
};

const secretKey = "{{secret-key}}";

function generateToken(reqBody, secretKey) {
  const token = jwt.sign(reqBody, secretKey,
  { expiresIn: 60 * 15
  });
  return token;
}

const token = generateToken(reqBody, secretKey);
try {
  fs.writeFileSync('token.json', JSON.stringify({ token: token
  })
);
  // file written successfully
} catch (err) {
  console.error(err);
}
