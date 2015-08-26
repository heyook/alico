`import DS from 'ember-data'`
`import Ember from 'ember'`
`import { test, moduleForModel } from 'ember-qunit'`

invoice = null
moduleForModel 'invoice', {
  needs: [
    "model:fee",
    "model:product",
    "model:charge",
    "model:plan"
  ]
  beforeEach: ->
    invoice = @subject(uid: "001")
}

test 'It is a valid ember-data Model', (assert) ->
  assert.ok(invoice)
  assert.ok(invoice instanceof DS.Model)

test 'It has uid', (assert) ->
  assert.equal invoice.get('uid'), "001"

test 'It has fees', (assert) ->
  store = @store()

  Ember.run =>
    fee = store.createRecord 'fee', name: 'shipping', price: 20
    invoice.get('fees').addObject fee

  assert.equal invoice.get('fees.length'), 1, 'it can add fees'

test 'It has products', (assert) ->
  store = @store()

  Ember.run =>
    product = store.createRecord 'product', name: 'Harley Exaust', price: 200
    invoice.get('products').addObject product

  assert.equal invoice.get('products.length'), 1, 'it can add products'

test 'It has charge', (assert) ->
  store = @store()

  Ember.run =>
    invoice.set('charge', store.createRecord('charge'))

  assert.equal invoice.get('charged'), true, 'it marks as charged'

addProductToInvoice = (store, invoice, product) ->
  product = store.createRecord 'product', product
  invoice.get('products').addObject product

addFeeToInvoice = (store, invoice, fee) ->
  fee = store.createRecord 'fee', fee
  invoice.get('fees').addObject fee

test 'It computes subTotal cost', (assert) ->
  store = @store()

  Ember.run =>
    addProductToInvoice store, invoice, name: 'Harley Exaust', price: 200
    addProductToInvoice store, invoice, name: 'Harley Motor', price: 2000

  assert.equal invoice.get('subTotal'), 2200, 'it computes product price'

test 'It computes total cost', (assert) ->
  store = @store()

  Ember.run =>
    addProductToInvoice store, invoice, name: 'Harley Exaust', price: 200
    addFeeToInvoice store, invoice, name: 'shipping', price: 20
    addFeeToInvoice store, invoice, name: 'discount', price: -30

  assert.equal invoice.get('feeTotal'), -10, 'it computes fee price'
  assert.equal invoice.get('price'), 190, 'it computes total price'
