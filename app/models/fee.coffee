`import DS from 'ember-data'`

Fee = DS.Model.extend
  name:       DS.attr('string')
  price:      DS.attr('number')
  invoice:    DS.belongsTo("invoice")
  plan:       DS.belongsTo("plan")

`export default Fee`
