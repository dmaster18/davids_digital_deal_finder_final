class UsersController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :destroy]

  def index
    if session[:user_id]
      redirect_to user_path(session[:user_id])
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password_required = true
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully signed up!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @wishlists = @current_user.wishlists
    @reviews = Review.all
  end

  def edit
  end

  def update
    if @current_user.update(user_params)
      flash[:success] = "You have successfully updated your account!"
      redirect_to user_path(@current_user)
    else
      render :edit
    end
  end

  def destroy
    if @current_user
      session.destroy
      @current_user.destroy
      flash[:success] = "You have successfully deleted your account!"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :username_confirmation, :password, :password_confirmation, :first_name, :last_name, :email_address)
  end



end
