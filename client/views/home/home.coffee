Template.Home.helpers
  tasks: ->
    Tasks.find({userId: Meteor.userId()})
  todos: ->
    Todos.find({userId: Meteor.userId()})
  iftasksnull:->
    Tasks.find({userId: Meteor.userId()}).count() is 0
  iftodosnull:->
    Todos.find({userId: Meteor.userId()}).count() is 0


Template.Home.events
  'click .todoitem': (event, tmpl) ->
    selectedTodoId = tmpl.$(event.currentTarget).data('todoid')
    Router.go "/todoitem/#{selectedTodoId}"

  'click #buttonAddTask': (event, tmpl)->
    Router.go "/organizer"

  'click #buttonAddTodo': (event, tmpl)->
    Router.go "/todo-choose"

Template.Home.onRendered ->
  $('.mdl-card__title button').addClass('mdl-button').addClass('mdl-js-button').addClass('remove-task-button')