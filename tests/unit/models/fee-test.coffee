`import DS from 'ember-data'`
`import Ember from 'ember'`
`import { test, moduleForModel } from 'ember-qunit'`

fee = null
moduleForModel 'fee', {
  needs: [
    "model:invoice",
    "model:product",
    "model:charge",
    "model:plan"
  ]
  beforeEach: ->
    fee = @subject(name: "shipping", price: 200)
}

test 'Fee is a valid ember-data Model', (assert) ->
  assert.ok(fee)
  assert.ok(fee instanceof DS.Model)

test 'Fee has name and price', (assert) ->
  assert.equal(fee.get('name'), 'shipping')
  assert.equal(fee.get('price'), 200)

test 'Fee belongs to invoice', (assert) ->
  store = @store()

  Ember.run =>
    fee.set('invoice', store.createRecord('invoice'))

  assert.ok(fee.get('invoice') instanceof DS.Model)
