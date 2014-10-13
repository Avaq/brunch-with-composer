module.exports = ->
  @Given /^I visit TODOMVC$/, ->
    @driver.get 'http://todomvc.com/architecture-examples/backbone/'

  @When /^I enter \"([^\"]*)\"$/, (value) ->
    new @Widget(root: "#new-todo")
    .sendKeys value, '\uE007'

  @Then /^I should see \"([^\"]*)\"$/, (expected) ->
    List = @Widget.List.extend
      root: "#todo-list",
      childSelector: "li"

    new List().readAt(0).should.eventually.eql expected

  @When /^complete the first todo$/, ->
    new @Widgets.TodoList().complete(0)

  @Then /^I should see that the first todo is completed$/, ->
    new @Widgets.TodoList()
    .isCompleted(0).should.eventually.eql true
