class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
before_action :authenticate , only: [:index, :create]

def authenticate
  redirect_to( new_user_session_path)  unless  user_signed_in? 
end

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

 

  

 

def create
  @lecture = Lecture.find params[:id]
  @comment = @lecture.comments.create(comment_params)
  @comment.user_id = current_user.id
  if @comment.save
    redirect_to @lecture
  else
    flash.now[:danger] = "error"
  end
  end

   def comment_params
      params.require(:comment).permit(:body, :user_id ,:commentable_id)
    end


end
