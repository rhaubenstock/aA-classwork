class CommentController < ApplicationController

    def index
        if params[:user_id]
            comments = Comment.where(author_id: params[:user_id])
        else
            comments = Comment.where(artwork_id: params[:artwork_id])
        end

        render json: comments
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :author_id, :artwork_id)
    end
end
