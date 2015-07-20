`import DS from 'ember-data'`
`import Ember from 'ember'`
`import { test, moduleForModel } from 'ember-qunit'`

product = null
moduleForModel 'product', {
  needs: ["model:invoice", "model:fee", "model:charge"]
  beforeEach: ->
    product = @subject(name: 'Harley Exaust', price: 200)
}

test 'It is a valid ember-data Model', (assert) ->
  assert.ok(product)
  assert.ok(product instanceof DS.Model)

test 'It has name and price', (assert) ->
  assert.equal(product.get('name'), 'Harley Exaust')
  assert.equal(product.get('price'), 200)

test 'It belongs to invoice', (assert) ->
  store = @store()

  Ember.run =>
    product.set('invoice', store.createRecord('invoice'))

  assert.ok(product.get('invoice') instanceof DS.Model)
