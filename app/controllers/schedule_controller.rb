class ScheduleController < ApplicationController

    before_action :have_to_login
    before_action :current_team
    before_action :have_to_create_team
    before_action :variable
    before_action :teams_of_current_user_apart_from_current_team
    
    def team_schedule
      if @current_team && @current_team.captain_id == @current_user.id
      else
        flash[:notice] = "あなたはキャプテンではありません"
        redirect_to team_create_path
      end
    end
  
    def teammate_schedule
    end
  
    def schedule
      if FirstSchedule.find_by(team_id: @current_team.id) == nil && SecondSchedule.find_by(team_id: @current_team.id) == nil
        month1 = Date.today.month
        month2 = Date.today.month + 1
      else
        month1 = Date.today.month + 1
        month2 = Date.today.month + 1
      end 
      @dates1 = FirstSchedule.new(
        user_id: @current_user.id,
        team_id: @current_team.id,
        month: month1,
        fir: params[:"1_1"],
        sec: params[:"2_1"],
        thi: params[:"3_1"],
        fou: params[:"4_1"],
        fif: params[:"5_1"],
        six: params[:"6_1"],
        sev: params[:"7_1"],
        eig: params[:"8_1"],
        nin: params[:"9_1"],
        ten: params[:"10_1"],
        ele: params[:"11_1"],
        twe: params[:"12_1"],
        ten_thi: params[:"13_1"],
        ten_fou: params[:"14_1"],
        ten_fif: params[:"15_1"],
        ten_six: params[:"16_1"],
        ten_sev: params[:"17_1"],
        ten_eig: params[:"18_1"],
        ten_nin: params[:"19_1"],
        twentieth: params[:"20_1"],
        twe_fir: params[:"21_1"],
        twe_sec: params[:"22_1"],
        twe_thi: params[:"23_1"],
        twe_fou: params[:"24_1"],
        twe_fif: params[:"25_1"],
        twe_six: params[:"26_1"],
        twe_sev: params[:"27_1"],
        twe_eig: params[:"28_1"],
        twe_nin: params[:"29_1"],
        thirtieth:params[:"30_1"],
        thi_fir: params[:"31_1"],
        status: params[:id]
      )
      @dates2 = SecondSchedule.new(
        user_id: @current_user.id,
        team_id: @current_team.id,
        month: month2,
        fir: params[:"1_2"],
        sec: params[:"2_2"],
        thi: params[:"3_2"],
        fou: params[:"4_2"],
        fif: params[:"5_2"],
        six: params[:"6_2"],
        sev: params[:"7_2"],
        eig: params[:"8_2"],
        nin: params[:"9_2"],
        ten: params[:"10_2"],
        ele: params[:"11_2"],
        twe: params[:"12_2"],
        ten_thi: params[:"13_2"],
        ten_fou: params[:"14_2"],
        ten_fif: params[:"15_2"],
        ten_six: params[:"16_2"],
        ten_sev: params[:"17_2"],
        ten_eig: params[:"18_2"],
        ten_nin: params[:"19_2"],
        twentieth: params[:"20_2"],
        twe_fir: params[:"21_2"],
        twe_sec: params[:"22_2"],
        twe_thi: params[:"23_2"],
        twe_fou: params[:"24_2"],
        twe_fif: params[:"25_2"],
        twe_six: params[:"26_2"],
        twe_sev: params[:"27_2"],
        twe_eig: params[:"28_2"],
        twe_nin: params[:"29_2"],
        thirtieth:params[:"30_2"],
        thi_fir: params[:"31_2"],
        status: params[:id]
      )
      if @dates1.save && @dates2.save
        flash[:notice] = "登録しました"
        redirect_to match_path
      else
        falsh[:notice] = "登録に失敗しました"
        render action: :schedule
      end
    end


end
