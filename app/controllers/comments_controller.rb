class CommentsController < ApplicationController
	
before_filter :confirm_logged_in
  def create
    @tasklist = Tasklist.where(id: params[:tasklist_id]).first
    @comment = @tasklist.comments.create(body: params[:comment][:body], commenter_id: @current_user.try(:id))
    redirect_to tasklist_path(@tasklist)
  end
end

