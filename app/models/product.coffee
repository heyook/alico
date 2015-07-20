`import DS from 'ember-data'`

Product = DS.Model.extend
  name:       DS.attr('string')
  price:      DS.attr('number')
  invoice:    DS.belongsTo("invoice")

`export default Product`
