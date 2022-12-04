class ToolNumbersController < ApplicationController
  before_action :set_tool_list!, only: %i[edit update new show create destroy]
  before_action :set_tool_number!, only: %i[edit update show destroy]

  def new
    @tool_number = @tool_list.tool_numbers.new
  end

  def show; end

  def create
    @tool_number = @tool_list.tool_numbers.build tool_number_params
    @tool_category = @tool_list.tool_category

    if @tool_number.save
      flash[:success] = t(:tool_number_created)
      redirect_to tool_category_tool_list_path(@tool_category, @tool_list)
    else
      flash[:error] = t(:error)
      render 'new'
    end
  end

  def edit; end

  def update
    if @tool_number.update tool_number_params
      flash[:success] = t(:tool_number_updated)
      redirect_to tool_list_path(@tool_list)
    else
      flash[:error] = t(:error)
      render 'edit'
    end
  end

  def destroy
    @tool_number.destroy
    flash[:success] = t(:tool_number_deleted)
    redirect_to tool_list_path(@tool_list)
  end

  private

  def tool_number_params
    params.require(:tool_number).permit(:number, :body)
  end

  def set_tool_list!
    @tool_list = ToolList.find params[:tool_list_id]
  end

  def set_tool_number!
    @tool_number = @tool_list.tool_numbers.find params[:id]
  end

end
