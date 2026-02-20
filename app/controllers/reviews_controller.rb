class ReviewsController < ApplicationController
  before_action :set_list
  before_action :set_review, only: [ :destroy ]

  def create
    @review = @list.reviews.new(review_params)
    if @review.save
      redirect_to @list, notice: "Review was added."
    else
      redirect_to @list, alert: @review.errors.full_messages.to_sentence
    end
  end

  def destroy
    @review.destroy
    redirect_to @list, notice: "Review removed."
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_review
    @review = @list.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
