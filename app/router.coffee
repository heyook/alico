`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend(location: config.locationType)
Router.map ->
  @route 'invoices', ->
    @resource 'invoice', path: "/:invoice_id"
  @route 'plan', path: "/plan/:plan_id"

`export default Router`
