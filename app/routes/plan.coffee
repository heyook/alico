`import Ember from 'ember'`

PlanRoute = Ember.Route.extend

  model: (params) ->
    @store.findRecord 'plan', params.plan_id

`export default PlanRoute`
