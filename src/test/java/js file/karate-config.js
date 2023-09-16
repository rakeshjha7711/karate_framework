

function fn() {
  if (!env) {
    env = 'staging';
  }
  var config = {  
    env: env,
    baseurl: 'https://apitest.livquik.com',
    
    
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