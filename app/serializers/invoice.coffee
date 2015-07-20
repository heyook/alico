`import DS from 'ember-data'`

InvoiceSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,
  isNewSerializerAPI: true
  attrs:
    products:
      embedded: 'always'
    fees:
      embedded: 'always'

`export default InvoiceSerializer`
