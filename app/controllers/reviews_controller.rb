class ReviewsController < ApplicationController
  before_action require: :user
  before_action :find_pet
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def new
  	@review = Review.new
  end

  def create
  	@review = Review.new(review_params)
    @review[:pet_id] = params[:pet_id]
  	if @review.save 
  		redirect_to pet_path(@pet)
  	else
  		render :new
    end
  end

  def show
  end

  def edit
  end

  def update
		if @review.update(review_params)
			redirect_to pet_review_path(@pet, @review)
		else
			render :edit
		end
  end

  def destroy
		@review.destroy
		redirect_to pet_path(@pet)
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def find_pet
  	@pet = Pet.find(params[:pet_id])
  end

  def review_params
  	params.require(:review).permit(:comment, :rating, :pet_id)
  end
end
