class ToolVariantsController < ApplicationController
  before_action :set_tool!, only: %i[edit update new show create destroy]
  before_action :set_tool_variant!, only: %i[edit update show destroy]

  def new
    @tool_variant = @tool.toolVariants.new
  end

  def show; end

  def create
    @tool_variant = @tool.toolVariants.build tool_variant_params

    if @tool_variant.save
      flash[:success] = t(:tool_variant_created)
      redirect_to tool_path(@tool)
    else
      flash[:error] = t(:error)
      render 'tools/show'
    end
  end

  def edit; end

  def update
    if @tool_variant.update tool_variant_params
      flash[:success] = t(:tool_variant_updated)
      redirect_to tool_path(@tool)
    else
      flash[:error] = t(:error)
      render 'edit'
    end
  end

  def destroy
    @tool_variant.destroy
    flash[:success] = t(:tool_variant_deleted)
    redirect_to tool_path(@tool)
  end

  private

  def tool_variant_params
    params.require(:tool_variant).permit(:tool_number, :body)
  end

  def set_tool!
    @tool = Tool.find params[:tool_id]
  end

  def set_tool_variant!
    @tool_variant = @tool.toolVariants.find params[:id]
  end

end
