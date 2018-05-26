class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to product_path(@product)
    else
      redirect_to :back
    end
  end

  def review_params
    params.require(:review).permit(
      :user,
      :product,
      :rating,
      :description
    )
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@product.id), notice: 'Product deleted!'
  end

end
