class reviewsController < ApplicationController
  before_action :find_pet

  def new
  	@review = Review.new
  end

  def create
  	@review = @pet.reviews.new(review_params)
  	if @review.save 
  		redirect_to pet_path(@pet)
  	else
  		render :new
    end
  end

  def show
  	@review = @pet.reviews.find(params[:id])
  end

  def edit
  	@review = @pet.review.find(params[:id])
  end

  def update
  	@review = @pet.reviews.find(params[:id])
		if @review.update(review_params)
			redirect_to pet_review_path(@pet, @review)
		else
			render :edit
		end
  end

  def destroy
  	@review = @pet.reviews.find(params[:id])
		@review.destroy
		redirect_to list_path(@pet)
  end

  private

  def find_list
  	@pet = Pet.find(params[:pet_id])
  end

  def review_params
  	params.require(:review).permit(:type, :description, :completed, :pet_id)
  end
end
