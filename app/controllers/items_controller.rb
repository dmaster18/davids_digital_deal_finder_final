class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :current_user

  def index
    @items = Item.all
    @purchased_items = @current_user.items.purchased
  end

  def new
    @item = Item.new
    @errors ||= @item.errors
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "#{@item.title} successfully created!"
      redirect_to item_path(@item)
    else
      @reviews = @item.reviews
      @errors = @item.errors
      @wishlists = @current_user.wishlists
      render :new
    end
  end

  def show
    if params[:wishlist_ids] || params[:ordered]
      @item.update(show_item_params)
      flash[:success] = "#{@item.title} successfully updated!"
      redirect_to item_path(@item)
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = "#{@item.title} successfully updated!"
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    flash[:success] = "#{@item.title} successfully deleted!"
    redirect_to items_path
  end

  def search
    if !search_item_params.nil? && search_item_params != ""
        @items = Item.search(search_item_params)
        render "items/search_results"
    end
  end


  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :sale_price, :original_price, :link, :retailer, :source, :ordered, wishlist_ids:[])
  end

  def show_item_params
    params.require(:item).permit(:ordered, wishlist_ids:[])
  end

  def search_item_params
    params.require(:item).permit(:search)
  end

  def set_item
    @current_user ||= current_user
    if session[:user_id]
      @item = Item.find(params[:id])
      @wishlists = @current_user.wishlists
      @reviews = @item.reviews
      @errors = @item.errors
    else
      redirect_to root_path
    end
  end

end
