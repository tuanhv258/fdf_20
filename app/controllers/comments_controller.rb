class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build comment_params
    @comment.save ? status = t(".success"): status = t(".fail")
    response_to_json status
  end

  private

  def comment_params
    params.require(:comment).permit :user_id, :product_id, :content
  end

  def response_to_json status
    render json: {
     status: status
    }
  end
end
