class QuizzesController < ApplicationController
  def index
  	@quizzes = Quiz.all
  end

  def show
  	@quiz = Quiz.find(params[:id])
  end

  def new
  	@quiz = Quiz.new
  end

  def create
  	@quiz = Quiz.new(quiz_params)
  	if @quiz.save
  		redirect_to course_quizzes_path
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
  		redirect_to course_quizzes_path
  	else
  		render :edit
  	end
  end

private

	def quiz_params
		params.require(:quiz).permit(:title)
	end

end