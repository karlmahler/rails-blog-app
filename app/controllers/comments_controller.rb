class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(allowed_comment_parameters)

    redirect_to @article
  end

  private

  def allowed_comment_parameters
    params.require(:comment).permit(:commenter, :body)
  end
end
