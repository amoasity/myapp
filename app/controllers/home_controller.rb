class HomeController < ApplicationController

    before_action :teams_of_current_user
    before_action :current_team

    def index
        if TeamUser.where(user_id: @current_user.id).first
            team = Team.find_by(id: TeamUser.where(user_id: @current_user.id).first.team_id)
            if team && session[:team_id] == nil
                session[:team_id] = team.id
            end
        end
    end

end
