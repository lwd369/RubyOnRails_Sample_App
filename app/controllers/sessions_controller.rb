class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
     # do...
      log_in user
      redirect_to user
    else
      #create error message
      flash.now[:danger] = '输入的用户名或密码不正确'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
