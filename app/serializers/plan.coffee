`import DS from 'ember-data'`

PlanSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,
  isNewSerializerAPI: true
  attrs:
    users:
      embedded: 'always'

`export default PlanSerializer`
