class SignController < ApplicationController

    before_action :already_login, {only: [:signin_form, :signup_form]}

    def signin_form
    end
  
    def signin
      @user = User.find_by(
        email: params[:email],
        password_digest: params[:password_digest]
      )
      if @user
        session[:user_id] = @user.id
        if TeamUser.where(user_id: @user.id).first
          team = Team.find_by(id: TeamUser.where(user_id: @user.id).first.team_id)
          session[:team_id] = team.id
        end
        flash[:notice] = "ログインしました"
        redirect_to home_path
      else
        flash[:notice] = "存在しません"
        redirect_to action: :signin_form
      end
    end
  
    def signup_form
    end
  
    def signup
      @user = User.new(
        name: params[:name],
        email: params[:email],
        password_digest: params[:password_digest]
      )
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "登録しました"
        redirect_to home_path
      else
        redirect_to action: :signup_form
      end
    end
  
    def logout
      session[:user_id] = nil
      session[:team_id] = nil
      flash[:notice] = "ログアウト"
      redirect_to("/")
    end

end
