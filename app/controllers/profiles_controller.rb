class ProfilesController < ApplicationController

    def create
       # byebug
       profile = current_user.build_profile(profile_param)
      #  profile = Profile.new(profile_param)
        if profile.save
            render json: profile
        else
            render json: {error: 'Profile not insert'}
        end
    end

    def index
        profiles = Profile.all
        render json: profiles
    end

    def update
        user = User.find_by(id: params[:id])
        profile = user.profile
        if profile.present?
            profile.update(profile_param)
            render json: {message: 'profile update successfull'}
        else
            render json: {error: 'Profile not found for update'}
        end
    end

    def show
        profile = current_user.profile   # find by current user (active user who is login)
    
        # profile = Profile.find_by(id: params[:id])    -----find by id
        if profile.present?
          render json: profile
        else
          render json: {error: "Profile no found"}
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        profile = user.profile
        if profile.present?
            profile.destroy
            render json: {message: 'profile deleted'}
        else
            render json: {error: 'profile not found for delete'}
        end
    end

    private
    def profile_param
        params.require(:profiles).permit(:address, :phone_number, :city, :state, :country, :user_id)
    end
end
