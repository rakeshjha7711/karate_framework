function fn(payload) {
  var temp = payload.mobileNumber + ':' + payload.deviceId;
  var Base64 = Java.type('java.util.Base64');
  var encoded = Base64.getEncoder().encodeToString(temp.toString().getBytes());
  return 'Basic ' + encoded;
}