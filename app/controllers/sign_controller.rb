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
        flash[:notice] = "success signin"
        redirect_to home_path
      else
        flash[:notice] = "not exist"
        render action: :signin_form
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
        flash[:notice] = "success signup"
        redirect_to home_path
      else
        render action: :signup_form
      end
    
    end
  
    def logout
      session[:user_id] = nil
      session[:team_id] = nil
      flash[:notice] = "logout"
      redirect_to("/")
      
    end

end
