`import DS from 'ember-data'`

Plan = DS.Model.extend
  name:       DS.attr('string')
  price:      DS.attr('number')
  plan_id:    DS.attr('string')
  image_url:  DS.attr('string')
  subscription: DS.belongsTo('subscription', { async: false })
  users:       DS.hasMany("user", { async: false })

`export default Plan`
