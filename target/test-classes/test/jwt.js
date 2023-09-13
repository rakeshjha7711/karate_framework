function generateToken(secretKey, issuer, subject, expiresInMinutes) {
  var Base64 = Java.type('java.util.Base64');
  var JwtBuilder = io.jsonwebtoken.Jwts.builder();
  var signatureAlgorithm = io.jsonwebtoken.SignatureAlgorithm.HS256;
  var bytes = Base64.getEncoder().encodeToString(secretKey.getBytes('utf-8'));
  var now = new Date().getTime();
  var expires = new Date(now + expiresInMinutes * 60000);
  JwtBuilder.setIssuer(issuer);
  JwtBuilder.setSubject(subject);
  JwtBuilder.setIssuedAt(new Date(now));
  JwtBuilder.setExpiration(expires);
  JwtBuilder.signWith(signatureAlgorithm, bytes);
  return JwtBuilder.compact();
}
