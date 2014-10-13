CommentList = require './comment-list'
CommentForm = require './comment-form'

class CommentBox extends Component

  getInitialState: -> data:[]

  reloadComments: ->
    $.ajax
      url: @props.url
      dataType: 'json'
    .done (data) => @setState {data}
    .fail (xhr, status, err) => console.error @props.url, status, err.toString()

  submitComment: (comment) ->
    index = @state.data.length
    @setState data: @state.data.concat [comment]
    $.ajax
      url: @props.url
      dataType: 'json'
      method: 'POST'
      data: comment
    .fail (xhr, status, err) =>
      data = @state.data.slice(0)
      data.splice index, 1,
        author: 'SYS'
        text: "Failed to post your message: #{err}"
      @setState {data}

  componentDidMount: ->
    @reloadComments()
    # setInterval @reloadComments, @props.pollEvery

  render: ->
    <div className="commentBox">
      <h1>Comments</h1>
      <CommentList data={@state.data} />
      <CommentForm onSubmit={@submitComment} />
    </div>

module.exports = CommentBox.toComponent()
