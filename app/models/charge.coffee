`import DS from 'ember-data'`

Charge = DS.Model.extend
  email: DS.attr('string')
  token: DS.attr("string")
  price_in_cents: DS.attr("number")
  invoice:  DS.belongsTo('invoice')

`export default Charge`
