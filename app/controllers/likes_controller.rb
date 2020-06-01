#a controller to handle likes 
class LikesController < ApplicationController
    #this is a helper method that runs before the creation of a like
    before_action :already_liked?

    #this action creates a new like
    def create
        #if an old like is present in the database for the same user and the same post, then delete that like
        if @old_like
            Like.destroy(@old_like.id)
        else
            #if there is no like prior to this, then create a new like 
            @new_like = current_user.likes.build(post_id: params[:post_id])
            #save the like to the database
            @new_like.save
        end
        #redirect user to the root_path
        redirect_to root_path
    end

    private
    #this is a helper method that checks if a like already exists for the current user and the given post
    def already_liked?
        @old_like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    end
end
