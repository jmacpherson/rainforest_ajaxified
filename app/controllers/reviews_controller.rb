class ReviewsController < ApplicationController
  before_filter :load_product

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user_id = current_user.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to product_path(@product.id), notice: "Review added." }
        format.js {}  # this will look for app/views/reviews/create.js.erb
      else
        format.html { render 'products/show', alert: "There was an error." }
        format.js {}  # this will look for app/views/reviews/create.js.erb
      end
    end
  end

  def edit
  end

  def update
    
  end

  private
  def review_params
    params.require(:review).permit(:content, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end
