`import DS from 'ember-data'`

User = DS.Model.extend
  name:       DS.attr('string')
  email:      DS.attr('string')
  plan:       DS.belongsTo("plan")

`export default User`
