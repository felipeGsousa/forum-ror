class JoinsController < ApplicationController

    def new
       
    end

    def create 
        @forun = Forun.find(params[:forun_id])
        Current.user.foruns.push(@forun)
        redirect_to forun_url(@forun)
    end
    
    def destroy
        @user_foruns = UserForun.all
        @forun = Forun.find(params[:forun_id])
        @user_foruns.each do |user_forun|
            if user_forun.user == Current.user && user_forun.forun == @forun
                user_forun.destroy
            end
        end
        redirect_to forun_url(@forun)
    end
    
end
