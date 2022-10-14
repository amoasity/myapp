class TeamController < ApplicationController

    before_action :have_to_login
    before_action :current_team
    before_action :teams_of_current_user_apart_from_current_team
  
    def create_form
    end
  
    def create
      @team = Team.new(
        name: params[:name],
        captain_id: @current_user.id,
        average_age: params[:average_age],
        active_area: params[:active_area]
      )
      if @team.save
        session[:team_id] = @team.id
        @team_user = TeamUser.new(
          user_id: @current_user.id,
          team_id: @team.id
        )
        @talk_room = TalkRoom.new(
          status: 2,
          team_id: @team.id
        )
        if @team_user.save && @talk_room.save
          flash[:notice] = "success create"
          redirect_to("/home")
        else
          flash[:notice] = "fail create"
          redirect_to("/team/create")
        end
      else
        flash[:notice] = "fail create"
        redirect_to("/team/create")
      end
    end
  
    def detail
      @team = Team.find_by(id: params[:id])
      teamusers = TeamUser.where(user_id: @current_user.id)
      @teams_id = teamusers.pluck(:team_id)
      teamuserss = TeamUser.where(team_id: params[:id])
      users_id = teamuserss.pluck(:user_id)
      @users = User.where(id: users_id)
    end
  
    def join
      @team_user = TeamUser.new(
        user_id: @current_user.id,
        team_id: params[:id]
      )
      if @team_user.save
        session[:team_id] = params[:id]
        flash[:notice] = "success join"
        redirect_to home_path
      else
        flash[:notice] = "fail join"
        render action: :match_path
      end
    end
  
    def change
      if params[:team_id]
        session[:team_id] = params[:team_id]
        redirect_to home_path
      end
    end

end
