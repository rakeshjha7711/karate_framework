function generateJwtToken() {
  var payload = {
    mobileNumber: "+918448848902",
    deviceId: "EB57FCDE-097D-4483-8CCF-27649FFC8B2A"
  };
  var secret = "your-secret-key";
  var jwt = require('jsonwebtoken');
  var token = jwt.sign(payload, secret);
  karate.log('Generated token:', token);
  return token;
}