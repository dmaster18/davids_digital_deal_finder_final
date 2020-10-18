class SessionsController < ApplicationController


  def new
    @user = User.new
    render "/sessions/new"
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      @user = User.omniauth_login(auth_hash)
      @user.save
      session[:user_id] = @user.id
      flash[:success] = "#{@user.username} successfully logged in through GitHub!"
      redirect_to user_path(@user)
    elsif @user = User.find_by(username: params[:session][:username])
      @user.password_required = true
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        flash[:success] = "#{@user.username} successfully logged in!"
        redirect_to user_path(@user)
      else
        render "sessions/new"
      end
    else
        render "/sessions/new"
    end
  end

  def show
    redirect_to user_path(session[:user_id])
  end

  def destroy
    if session[:user_id]
      session.destroy
      flash[:success] = "You have successfully logged out."
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

end
