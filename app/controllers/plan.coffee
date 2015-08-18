`import Ember from 'ember'`
`import ApplicationController from './application'`

PlanController = ApplicationController.extend Ember.Evented,

  actions:

    processStripeToken: (token) ->
      Em.Logger.info token

      subscription = @store.createRecord 'subscription',
        token: token.id
        plan: @get('model')
        email: token.email

      subscription.save().then (response) =>
        # TODO: show success
        Em.Logger.info response
      , (error) =>
        # TODO: show error
        Em.Logger.info error

`export default PlanController`
