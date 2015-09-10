class AssignmentsController < ApplicationController
  def index
  	@assignments = Assignment.all
  end

  def show
  	@assignment = Assignment.find(params[:id])
  end

  def new
  	@assignment = Assignment.new
  end

  def create
  	@assignment = Assignment.new(assignment_params)
  	if @assignment.save
  		redirect_to course_assignments_path
  	else
  		render :new
  	end
  end

  def edit
  	@assignment = Assignment.find(params[:id])
  end

  def update
  	@assignment = Assignment.find(params[:id])
  	if @assignment.update(assignment_params)
  		redirect_to course_assignments_path
  	else
  		render :edit
  	end
  end

private

	def assignment_params
		params.require(:assignment).permit(:title)
	end

end