class MatchController < ApplicationController

    before_action :current_team
    before_action :date_adj
    before_action :variable
    before_action :teams_of_current_user
    before_action :teams_of_current_user_apart_from_current_team
    
    def search
      @teams = Team.all

      if params[:name] && params[:name] != ""
        @teams = Team.where("name LIKE ?", "%#{params[:name]}%")
      end

      if params[:active_area] && params[:active_area] != "---"
          @teams = @teams.where(active_area: params[:active_area])
      end

      if params[:date] && params[:date] != ""
        keys = @date_hash.key(params[:date].to_date.mday)
        if FirstSchedule.first || SecondSchedule.first
          if params[:date].to_date.month == FirstSchedule.first.month
            schedules = FirstSchedule.where.not(keys.to_sym => nil).where(status: 1)
            teams_id = schedules.pluck(:team_id)
            @teams = Team.where(id: teams_id)
          elsif params[:date].to_date.month == SecondSchedule.first.month
            schedules = SecondSchedule.where.not(keys.to_sym => nil).where(status: 1)
            teams_id = schedules.pluck(:team_id)
            @teams = Team.where(id: teams_id)
          end
        else
          @teams = nil
        end
      end
    end

end
