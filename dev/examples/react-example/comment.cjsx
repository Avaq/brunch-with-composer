class Comment extends Component

  render: ->
    <div className="comment">
      <h2 className="commentAuthor">
        {this.props.author}
      </h2>
      {this.props.children}
    </div>

module.exports = Comment.toComponent()
