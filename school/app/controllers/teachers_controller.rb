class TeachersController < ApplicationController
  def index
  	@teachers = Teacher.all
  end

  def show
  	@teacher = Teacher.find(params[:id])
  end

  def new
  	@teacher = Teacher.new
  end

  def create
  	@teacher = Teacher.new(teacher_params)
  	if @teacher.save
  		redirect_to teachers_path
  	else
  		render :new
  	end
  end

  def edit
  	@teacher = Teacher.find(params[:id])
  end

  def update
  	@teacher = Teacher.find(params[:id])
  	if @teacher.update(teachers_params)
  		redirect_to teachers_path
  	else
  		render :edit
  	end
  end

private

	def teacher_params
		params.require(:teacher).permit(:first_name, :last_name)
	end

end
