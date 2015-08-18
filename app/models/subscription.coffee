`import DS from 'ember-data'`

Subscription = DS.Model.extend
  plan:      DS.belongsTo('plan')
  email:     DS.attr('string')
  token:     DS.attr('string')

`export default Subscription`
