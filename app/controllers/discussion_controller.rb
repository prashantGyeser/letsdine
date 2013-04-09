class DiscussionController < ApplicationController
	before_filter :authenticate_user!
	def create
		@discussion = Discussion.new(params[:discussion])

		@discussion.user_id = current_user.id

		@group = Group.find(@discussion.group_id)

	    respond_to do |format|
	      if @discussion.save
	        format.html { redirect_to @group, notice: 'Comment was successfully added.' }
	        format.json { render json: @group, status: :created, location: @group }
	      else
	        session[:attendee_errors] = @discussion.errors

			format.html { redirect_to group_path(@group)}
      		format.json { render json: @discussion.errors, status: :unprocessable_entity }
	      end
	    end
	end
end
