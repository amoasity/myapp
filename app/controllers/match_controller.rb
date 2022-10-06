class MatchController < ApplicationController

    before_action :current_team
    before_action :date_adj
    
    def search
      pp @current_team
      @teams = Team.all
      @tomorrow = Date.today.tomorrow
      @end_of_next_month = Date.today.next_month.end_of_month
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
            @schedule = FirstSchedule.where.not(keys.to_sym => nil).where(status: 1)
            @team_ids = []
            @schedule.each do |schedule|
              @team_ids.push(schedule.team_id)
            end
            @teams = Team.where(id: @team_ids)
          elsif params[:date].to_date.month == SecondSchedule.first.month
            @schedule = SecondSchedule.where.not(keys.to_sym => nil).where(status: 1)
            @team_ids = []
            @schedule.each do |schedule|
              @team_ids.push(schedule.team_id)
            end
            @teams = Team.where(id: @team_ids)
          end
        else
          @teams = nil
        end
      end
    end

end
