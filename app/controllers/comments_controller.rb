class CommentsController < ApplicationController
    def create
        #we need to create a comment
        #we basically need a commentable id to save this post, the post obviously belongs to a user and thus the comment would indirectly belong to a user
        #to find the commentable, which can either be a post or a comment itself(in case of replies), we can use the params hash
        @new_comment = current_user.comments.build(comment_params)
        if @new_comment.save 
            #if the comment is saved successfully redirect to the timeline again
            redirect_to root_path
        else

        end
    end

    private
    
    def comment_params
        params.require(:comment).permit(:body,:commentable_id, :commentable_type)
    end
end
