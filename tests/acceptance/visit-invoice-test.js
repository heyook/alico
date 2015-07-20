import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from '../helpers/start-app';
import fixture from '../helpers/fixture';

var App;
var server;

module('integration:VisitInvoice', {
  setup: function() {
    App = startApp();
    server = new Pretender(function() {
      this.get('api/invoices/1', function(){
        return [200,
          {"Content-Type": "application/json"},
          JSON.stringify({invoice: fixture.invoices[0]})
        ];
      });
    });
  },
  teardown: function() {
    Ember.run(App, App.destroy);
    server.shutdown();
  },
});

test('visit invoice', function(assert) {
  visit('/invoices/1').then(function() {
    assert.equal(find('.product').length, 1, 'It shows 1 product');
    assert.equal(find('.product .name').text(), 'Harley Street 750 Exaust', 'It shows product name');
  });
});
