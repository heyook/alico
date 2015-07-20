`import DS from 'ember-data'`
`import Ember from 'ember'`
`import { test, moduleForModel } from 'ember-qunit'`

charge  = null
moduleForModel 'charge', {
  needs: ["model:fee", "model:product", "model:invoice"]
  beforeEach: ->
    charge = @subject(token: "abc", email: "abc@123.com", price_in_cents: 200)
}

test 'It is a valid ember-data Model', (assert) ->
  assert.ok(charge)
  assert.ok(charge instanceof DS.Model)

test 'It has token', (assert) ->
  assert.equal charge.get('token'), 'abc'

test 'It has email', (assert) ->
  assert.equal charge.get('email'), 'abc@123.com'

test 'It has price in cents', (assert) ->
  assert.equal charge.get('price_in_cents'), 200

test 'It has invoice', (assert) ->
  store = @store()

  Ember.run =>
    charge.set('invoice', store.createRecord('invoice'))

  assert.ok(charge.get('invoice') instanceof DS.Model)
