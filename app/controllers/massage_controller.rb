class MassageController < ApplicationController

    before_action :current_team

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
