class AssignmentsController < ApplicationController
  def index
  	@assignments = Assignment.where(course_id: params[:course_id])
  end

  def show
  	@assignment = Assignment.find(params[:id])
  end

  def new
  	@assignment = Assignment.new(course_id: params[:course_id])
  end

  def create
  	@assignment = Assignment.new(assignment_params)
  	if @assignment.save
  		redirect_to course_assignments_path(params[:course_id])
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
  		redirect_to course_assignments_path(params[:course_id])
  	else
  		render :edit
  	end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy
    redirect_to course_assignments_path(params[:course_id])
  end

private

	def assignment_params
		params.require(:assignment).permit(:title, :course_id)
	end

end
