class SessionsController < ApplicationController
  def new

  end

  def create
    if @user = User.find_by(email: params[:session][:email])
      if @user.authenticate(params[:session][:password])
        flash[:email] = "Welcome"
        sign_in(@user)
        redirect_to new_user_path
      else
        flash.now[:email] = "Bad password"
        render 'new'
      end
    else
      flash.now[:email] = "Bad email adress"
      render sessions_new_path
    end
  end
  def destroy
    sign_out
    render sessions_new_path
  end
end
