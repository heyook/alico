/* global require, module */
var EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  var app = new EmberApp(defaults, {
    dotEnv: {
      clientAllowedKeys: ['STRIPE_PK_KEY'],
      path: {
        development: './.env',
        staging: './.env',
        production: './.env.production'
      }
    }
  });

  //bootstrap
  app.import('bower_components/bootstrap/dist/css/bootstrap.css');
  app.import('bower_components/bootstrap/dist/js/bootstrap.js');
  app.import('bower_components/bootstrap/dist/css/bootstrap.css.map', {
       destDir: 'assets'
  });

  return app.toTree();
};
