Feature: My feature

  Background:
    * def generateJwtToken =
      """
      function() {
      var tokenGenerator = new JavaAdapter(java.util.function.Function, {
      apply: function() {
      var payload = {
      mobileNumber: "+918448848902",
      deviceId: "EB57FCDE-097D-4483-8CCF-27649FFC8B2A"
      };
      var secret = "your-secret-key";
      var jwt = Java.type('io.jsonwebtoken.Jwts');
      var token = jwt.builder().setPayload(payload).signWith(io.jsonwebtoken.SignatureAlgorithm.HS256, secret.getBytes("UTF-8")).compact();
      karate.log('Generated token:', token);
      return token;
      }
      });
      return tokenGenerator.apply();
      }
      """

  Scenario: My scenario

    Given def jwtToken = generateJwtToken()
    And header Authorization = 'Bearer ' + jwtToken
    And url 'https://api.example.com/path/to/endpoint'
    When method GET
    Then status 200
