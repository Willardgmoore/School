class QuizzesController < ApplicationController
  def index
  	@quizzes = Quiz.where(course_id: params[:course_id])
  end

  def show
  	@quiz = Quiz.find(params[:id])
  end

  def new
  	@quiz = Quiz.new(course_id: params[:course_id])
  end

  def create
  	@quiz = Quiz.new(quiz_params)
  	if @quiz.save
  		redirect_to course_quizzes_path(params[:course_id])
  	else
  		render :new
  	end
  end

  def edit
  	@quiz = Quiz.find(params[:id])
  end

  def update
  	@quiz = Quiz.find(params[:id])
  	if @quiz.update(quiz_params)
  		redirect_to course_quizzes_path(params[:course_id])
  	else
  		render :edit
  	end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to course_quizzes_path(params[:course_id])
  end

private

	def quiz_params
		params.require(:quiz).permit(:title, :course_id)
	end

end
