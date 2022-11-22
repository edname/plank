# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show edit update destroy]

  def index
    @pagy, @questions = pagy(Question.order(created_at: :desc), items: 12)
      # @questions = Question.order(created_at: :desc).page params[:page] -This was used for kaminari
  end

  def show
    @answer = @question.answers.build
      @pagy, @answers = pagy @question.answers.order(created_at: :desc)
      # @answers = @question.answers.order(created_at: :desc).page(params[:page]).per(2) -This was used for kaminari
      # @answers = Answer.where(question_id: @question.id).order created_at: :desc
      # @answers = Answer.where(question: @question).order created_at: :desc
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
      if @question.save
        flash[:success] = 'Questions was created'
          redirect_to questions_path
      else
        flash[:error] = 'Something went wrong'
          render :new
      end
  end

  def edit
  end

  def update
    if @question.update question_params
      flash[:success] = 'Questions was successfully updated'
      redirect_to questions_path
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = 'Questions was successfully deleted.'
        redirect_to questions_path
    else
      flash[:error] = 'Something went wrong'
        redirect_to questions_path
    end
  end
    
    private
  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end

end
