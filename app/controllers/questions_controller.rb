# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show edit update destroy]

  def index
    @pagy, @questions = pagy(Question.order(created_at: :desc), items: 12)
    # @questions = Question.order(created_at: :desc).page params[:page] -This was used for kaminari
  end

  def show
    @answer = @question.answers.build
    @pagy, @answers = pagy(@question.answers.order(created_at: :desc), items: 8)
    # @answers = @question.answers.order(created_at: :desc).page(params[:page]).per(2) -This was used for kaminari
    # @answers = Answer.where(question_id: @question.id).order created_at: :desc
    # @answers = Answer.where(question: @question).order created_at: :desc
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t(:question_created)
      redirect_to questions_path
    else
      flash[:error] = t(:error)
      redirect_to :new
    end
  end

  def update
    if @question.update question_params
      flash[:success] = t(:question_updated)
      redirect_to questions_path
    else
      flash[:error] = t(:error)
      render 'edit'
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t(:question_deleted)
    else
      flash[:error] = t(:error)
    end
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end
