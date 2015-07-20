/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'alico',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {

    },

    i18n: {
      defaultLocale: 'zh' // default value
    },

    stripe: {
      key: process.env.STRIPE_PK_KEY,
      locale: "zh-CN"
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
    ENV.alico = {
      proxyHost:   'http://alicoapi.ngrok.com'
    },

    ENV.contentSecurityPolicy = {
      'connect-src': "'self' http://127.0.0.1:3000 ws://127.0.0.1:35729 http://127.0.0.1:4200 http://*.ngrok.com",
      'script-src' : "'self' 'unsafe-eval' http://127.0.0.1:35729 https://*.stripe.com http://*.cloudflare.com http://*.ngrok.com",
      'frame-src'  : "'self' https://*.stripe.com http://*.ngrok.com",
      'style-src'  : "'self' 'unsafe-inline'",
      'object-src' : "'self' http://*.ngrok.com",
      'img-src'    : "'self' https://*.amazonaws.com https://*.stripe.com http://*.ngrok.com http://127.0.0.1:4200"
    }
  }

  if (environment === 'test') {
    ENV.alico = {
      proxyHost:  ''
    },

    ENV.stripe.key = 'abc';

    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {
    ENV.formee = {
      proxyHost:  'http://api.alico.com'
    },

    ENV.contentSecurityPolicy = {
      'script-src' : "'self' 'unsafe-eval' https://*.stripe.com http://*.cloudflare.com",
      'frame-src'  : "'self' https://*.stripe.com",
      'style-src'  : "'self' 'unsafe-inline'",
      'img-src'    : "'self' https://*.amazonaws.com https://*.stripe.com"
    }

  }

  return ENV;
};
