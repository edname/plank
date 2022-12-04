# frozen_string_literal: true

class ToolListsController < ApplicationController
  before_action :set_tool_list!, only: %i[show edit update destroy]

  def index
    @pagy, @tool_lists = pagy ToolList.order(name: :asc)

    @tool_lists = ToolList.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new(@tool_lists)
        send_data(pdf.render, filename: 'tools_list.pdf', type: 'application/pdf', disposition: 'inline')
      end
    end
  end

  def show
    @tool_number = @tool_list.tool_numbers.build
    @pagy, @tool_numbers = pagy @tool_list.tool_numbers.order(number: :desc)
  end

  def new
    @tool_list = ToolList.new
  end

  def edit; end

  def create
    @tool_list = ToolList.new tool_list_params
    @tool_category = @tool_list.tool_category

    if @tool_list.save
      flash[:success] = t(:tool_list_created)
      redirect_to tool_category_path(@tool_category)
    else
      flash[:error] = t(:error)
      render :new
    end
  end

  def update
    if @tool_list.update tool_list_params
      flash[:success] = t(:tool_list_updated)
      redirect_to tool_lists_path
    else
      flash[:error] = t(:error)
      render 'edit'
    end
  end

  def destroy
    if @tool_list.destroy
      flash[:success] = t(:tool_list_deleted)
    else
      flash[:error] = t(:error)
    end
    redirect_to tool_lists_path    
  end

  private

  def tool_list_params
    params.require(:tool_list).permit(:name, :body, :tool_category_id)
  end

  def set_tool_list!
    @tool_list = ToolList.find params[:id]
  end

end
