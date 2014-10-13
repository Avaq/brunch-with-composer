module.exports = ->
  @Widgets or= {};

  @Widgets.TodoList = @Widget.List.extend

    root: "#todo-list"

    complete: (index) ->
      @clickAt(selector: "input", index: index)

    isCompleted: (index) ->
      @at(index).then (el) -> el.hasClass("completed")
