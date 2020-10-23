class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:show, :edit, :update, :destroy]
  before_action :current_user


  def index
    @wishlists = @current_user.wishlists
  end

  def new
    @wishlist = @current_user.wishlists.new
    @errors ||= @wishlist.errors
  end

  def create
    @wishlist = @current_user.wishlists.new(wishlist_params)
    if @wishlist.save
      flash[:success] = "#{@wishlist.name} successfully created!"
      redirect_to wishlist_path(@wishlist)
    else
      @errors = @wishlist.errors
      render :new
    end
  end

  def show
    if current_user.id == @wishlist.user_id
      render :show
    end
  end

  def edit
  end

  def update
    if @wishlist.valid? && @current_user.id == @wishlist.user_id
      @wishlist.update(wishlist_params)
      flash[:success] = "#{@wishlist.name} successfully updated!"
      redirect_to wishlist_path(@wishlist)
    else
      redirect_to wishlists_path
    end
  end

  def destroy
    if @current_user.id == @wishlist.user_id
      @wishlist.destroy
      flash[:success] = "#{@wishlist.name} successfully deleted!"
      redirect_to wishlists_path
    end
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:user_id, :name, :description, :ranking, item_ids:[])
  end

  def set_wishlist
    @current_user ||= current_user
    if session[:user_id]
      @wishlist = @current_user.wishlists.find(params[:id])
      @items = @wishlist.items
      @errors = @wishlist.errors
    else
      redirect_to wishlists_path
    end
  end

end
