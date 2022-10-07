class TalkController < ApplicationController

    before_action :teams_of_current_user
    before_action :current_team
    before_action :teams_of_current_user_apart_from_current_team
    
    def index
      teams_id = @teams_of_current_user.pluck(:id)
      @talk_rooms_of_teammate = TalkRoom.where(team_id: teams_id)
      teams_of_current_user_as_captain = Team.where(captain_id: @current_user.id)
      teams_id_of_current_user_as_captain = teams_of_current_user_as_captain.pluck(:id)
      @talk_rooms_of_applyer_captain = TalkRoom.where(applyer_team_id: teams_id_of_current_user_as_captain)
      @talk_rooms_of_receiver_captain = TalkRoom.where(receiver_team_id: teams_id_of_current_user_as_captain)
      pp @talk_rooms_of_teammate
    end
  
    def between_teams_room
      talk_room = TalkRoom.new(
        status: 1,
        applyer_team_id: @current_team.id,
        receiver_team_id: params[:id]
      ) 
      if talk_room.save
        flash[:notice] = "let's match"
        redirect_to("/talk_room/#{params[:id]}")
      else
        flash[:notice] = "fail"
        redirect_back(fallback_location: "/team/#{params[:id]}")
      end
    end

end
