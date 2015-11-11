/* global require, module */
var EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  var env = EmberApp.env();
  var isProductionLikeBuild = ['production', 'staging'].indexOf(env) > -1;
  var app = new EmberApp(defaults, {
    dotEnv: {
      clientAllowedKeys: [
        'AWS_KEY',
        'AWS_SECRET',
        'AWS_BUCKET',
        'AWS_REGION',
        'REDIS_URL',
        'ASSETS_URL'
      ]
    },
    fingerprint: {
      enabled: isProductionLikeBuild,
      prepend: process.env.ASSETS_URL
    },
    sourcemaps: {
      enabled: !isProductionLikeBuild,
    },
    minifyCSS: { enabled: isProductionLikeBuild },
    minifyJS: { enabled: isProductionLikeBuild },

    tests: process.env.EMBER_CLI_TEST_COMMAND || !isProductionLikeBuild,
    hinting: process.env.EMBER_CLI_TEST_COMMAND || !isProductionLikeBuild
  });

  //bootstrap
  app.import('bower_components/bootstrap/dist/css/bootstrap.css');
  app.import('bower_components/bootstrap/dist/js/bootstrap.js');
  app.import('bower_components/bootstrap/dist/css/bootstrap.css.map', {
       destDir: 'assets'
  });

  return app.toTree();
};
