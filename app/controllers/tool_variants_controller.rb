class ToolVariantsController < ApplicationController
  before_action :set_tool!, only: %i[index, create]

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

  private

  def tool_variant_params
    params.require(:tool_variant).permit(:tool_number, :body)
  end

  def set_tool!
    @tool = Tool.find params[:tool_id]
  end
end
