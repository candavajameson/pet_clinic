class PetsController < ApplicationController

	before_filter :set_pet, only: [:edit, :update, :show, :destroy]

	def index
		@pets = Pet.paginate(params[:page]).per(10)
	end

	def new
		@pet = Pet.new
	end

	def create
		@pet = Pet.new pet_params
		@pet.user = current_user

		if @pet.save
			redirect_to @pet, :notice => 'Successfully added pet'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @pet.update_attributes pet_params
			redirect_to @pet, :notice => 'Successfully updated pet details'
		else
			render 'edit'
		end
	end

	def destroy
		@pet.destroy
		redirect_to 'index'
	end

	private
	def pet_params 
		params.require(:pet).permit(:name,
									:date_of_birth)
	end

	def set_pet
		@pet = Pet.find(params[:id])
	end


end