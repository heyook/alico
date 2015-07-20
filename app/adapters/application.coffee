`import config from '../config/environment'`
`import DS from 'ember-data'`

ApplicationAdapter = DS.RESTAdapter.extend
  host: config.alico.proxyHost
  namespace: "api"

`export default ApplicationAdapter`
