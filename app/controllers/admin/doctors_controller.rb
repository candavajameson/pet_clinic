class Admin::DoctorsController < Admin::ApplicationController
	
	before_action :set_doctor, only: [:show, :destroy]

	def index
		@doctor = Doctor.page(params[:page]).per(10)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new doctor_params

		if @user.save

		else
			render 'new'
		end
	end

	def show
	end

	def update
 		if @user.update_attributes(doctor_params)
 		else
  		end
	end

	def destroy
		@user.destroy
	end

	private 
	def doctor_params
		params.require(:user).permit(:email,
										:password,
										:password_confirmation,
										doctor_attributes: [ 
											:name, 
											:description
										])
	end

	def set_doctor
		@user = User.find(params[:id])
	end

end