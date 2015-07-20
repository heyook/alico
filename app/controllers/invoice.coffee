`import Ember from 'ember'`
`import ApplicationController from './application'`

InvoiceController = ApplicationController.extend Ember.Evented,

  actions:

    processStripeToken: (token) ->
      Em.Logger.info token
      charge = @store.createRecord 'charge',
        token: token.id
        invoice: @get('model')
        price_in_cents: @get('model.price')
        email: token.email
      charge.save().then (response) =>
        # TODO: show success
        Em.Logger.info response
      , (error) =>
        # TODO: show error
        Em.Logger.info response

`export default InvoiceController`
