class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(content: params[:comment][:content], post_id: params[:post_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.'  }
        format.js {}
        format.json {render json: @comment, status: :created}
      else
        #TODO flash error don't work
        flash[:success] = 'Comment posted.'
        format.html { render action: "new"  }
        format.json { render json: @comment.errors, status: :unprocessable_entity  }
      end
    end
  end

  def destroy
    @comment = current_user.comments.find params[:id]
    @post = @comment.post
    if @comment.destroy
      respond_to do |format|
        format.html do
          flash[:success] = 'Comment deleted.'
          redirect_to @post
        end
        format.js # JavaScript response
      end
    else
      #TODO
    end
  end
end
