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
    end
  
    def new
      talk_room = TalkRoom.new(
        status: 1,
        applyer_team_id: @current_team.id,
        receiver_team_id: params[:id]
      ) 
      if talk_room.save
        flash[:notice] = "試合予定を立てましょう"
        redirect_to("/talk_room/#{params[:id]}")
      else
        flash[:notice] = "失敗しました"
        redirect_back(fallback_location: "/team/#{params[:id]}")
      end
    end

    def room
      @talk_room_id = params[:id].to_i
      @massages = Massage.where(talk_room_id: @talk_room_id)
      session[:team_id] = Team.find_by(id: TalkRoom.find_by(id: @talk_room_id).team_id).id
    end
  
    def create
      @massage = Massage.new(
        user_id: @current_user.id,
        talk_room_id: params[:id],
        content: params[:content]
      )
      if @massage.save
        redirect_back fallback_location: "talk_room/#{@talk_room_id}"
      else
        render action: :room
      end
    end

end
