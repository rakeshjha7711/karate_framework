function fn() {
  if (!env) {
    env = 'staging';
  }
  var config = {
    // variables & api paths
  }
  //'karate.env' - Get system property
  var env = karate.env;
  karate.log('karate.env system property was:', env);
  if (env == 'prod') {
    config.baseUrl = '';
  } else if (env == 'staging') {
    config.baseUrl = '';
  }
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}