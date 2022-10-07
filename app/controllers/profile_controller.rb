class ProfileController < ApplicationController

    before_action :teams_of_current_user
    before_action :teams_of_current_user_apart_from_current_team

    def show
    end

end
