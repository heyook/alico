`import DS from 'ember-data'`

mapBy    = Em.computed.mapBy
sumArray = Em.computed.sum

Plan = DS.Model.extend
  name:       DS.attr('string')
  price:      DS.attr('number')
  plan_id:    DS.attr('string')
  image_url:  DS.attr('string')
  subscription: DS.belongsTo('subscription', { async: false })
  users:      DS.hasMany("user", { async: false })
  fees:       DS.hasMany("fee", { async: false })

  feePrices:     mapBy    'fees', 'price'
  feeTotal:      sumArray 'feePrices'

  totalPrice: ( ->
    @get('price') + @get('feeTotal')
  ).property('price', 'feeTotal')

`export default Plan`
