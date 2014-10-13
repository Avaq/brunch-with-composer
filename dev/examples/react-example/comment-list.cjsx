Comment = require './comment'

class CommentList extends Component

  render: ->
    comments = @props.data.map (comment) -> <Comment author={comment.author}>{comment.text}</Comment>
    <div className="commentList">
      {comments}
    </div>

module.exports = CommentList.toComponent()
