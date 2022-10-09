class HomeController < ApplicationController

    before_action :teams_of_current_user
    before_action :current_team
    before_action :teams_of_current_user_apart_from_current_team

    def index
    end

end
