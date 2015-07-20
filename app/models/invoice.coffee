`import DS from 'ember-data'`

mapBy    = Em.computed.mapBy
sumArray = Em.computed.sum

Invoice = DS.Model.extend
  fees:       DS.hasMany("fee", { async: false })
  products:   DS.hasMany("product", { async: false })
  uid:        DS.attr('string')
  charge:     DS.belongsTo('charge', { async: false })

  productPrices: mapBy    'products', 'price'
  subTotal:      sumArray 'productPrices'
  feePrices:     mapBy    'fees', 'price'
  feeTotal:      sumArray 'feePrices'

  charged: Em.computed.bool 'charge.id'

  price: ( ->
    @get('subTotal') + @get('feeTotal')
  ).property('subTotal', 'feeTotal')

`export default Invoice`
