class CommentForm extends Component

  handleSubmit: (e) ->
    e.preventDefault()
    authorNode = @refs.author.getDOMNode()
    textNode = @refs.text.getDOMNode()
    author = authorNode.value.trim()
    text = textNode.value.trim()
    return unless text? and author?
    @props.onSubmit {author, text}
    authorNode.value = ''
    textNode.value = ''

  render: ->
    <form className="commentForm" onSubmit={@handleSubmit}>
      <input type="text" placeholder="Your name" ref="author" />
      <input type="text" placeholder="Say something..." ref="text" />
      <input type="submit" value="Post" />
    </form>

module.exports = CommentForm.toComponent()
