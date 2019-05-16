class ReviewsController < ApplicationController
  before_action :set_item

  def new
    @review = review.new
  end

  def create
    @review = @item.reviews.new(review_params)
    if @review.save
      redirect_to dept_item_path(@item.dept_id, @item)
    else
      render :new
    end
  end

  private
    def set_item
      @item = item.find(params[:item_id])
    end

    def review_params
      params.require(:review).permit(:body, :author)
    end
end
