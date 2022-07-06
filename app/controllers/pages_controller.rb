class PagesController < ApplicationController
    def home
        @user_foruns = UserForun.all
        @posts = Post.all
    end

    def user_comments
        @posts = Post.all
        @foruns = Forun.all 
        @comments = Comment.all
      end
    
    def user_posts  
        @foruns = Forun.all 
        @posts = Post.all
    end
end
