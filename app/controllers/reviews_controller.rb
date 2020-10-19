class ReviewsController < ApplicationController

  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :current_user

  def index
    @all_reviews = Review.all
    @my_reviews = @current_user.reviews
  end

  def new
    @review = @current_user.reviews.new
    @errors ||= @review.errors
  end

  def create
    @review = @current_user.reviews.new(review_params)
    if @review.valid? && @current_user.id == @review.user_id
      @review.save
      flash[:success] = "#{@review.title} successfully created!"
      redirect_to review_path(@review)
    else
      @errors = @review.errors
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @item = @review.item
    @user = @review.user
  end

  def edit
  end

  def update
    if @review.valid? && @current_user.id == @review.user_id
      @review.update(review_params)
      flash[:success] = "#{@review.title} successfully updated!"
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    if @current_user.id == @review.user_id
      @review.destroy
      flash[:success] = "#{@review.title} successfully deleted!"
      redirect_to reviews_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:item_id, :user_id, :title, :rating, :description, :item_and_user_id)
  end

  def set_review
    @current_user ||= current_user
    if session[:user_id]
      @review = @current_user.reviews.find(params[:id])
    else
      redirect_to root_path
    end
  end

end
