class PetsController < ApplicationController
	before_action require: :user
	before_action :find_pet, except: [:index, :new, :create]
  def index
  	@pets = Pet.all
  end

  def show
  end

  def new
  	@pet = Pet.new
  end

  def create
  	@pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
  	if @pet.save
  		redirect_to pet_path(@pet)
  	else
  		render :new
    end
  end

  def edit
  end

  def update
  	if @pet.update(pet_params)
  		redirect_to pet_path(@pet)
  	else
  		render :edit
    end
  end

  def destroy
  	@pet.destroy
  	redirect_to pets_path
  end

  private

  	def pet_params
  		params.require(:pet).permit(:name, :profile, :species, :fur_type, :fur_color, :gender, :age, :available, :breed, :user_id)
  	end

  	def find_pet
  		@pet = Pet.find(params[:id])
  	end
end
