class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    puts params.inspect
    puts @review.errors.full_messages unless @review.save

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      puts @review.errors.full_messages
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
