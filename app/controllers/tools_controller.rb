# frozen_string_literal: true

class ToolsController < ApplicationController
  before_action :set_tool!, only: %i[edit show]

  def index
    @pagy, @tools = pagy Tool.order(name: :asc)

    @tools = Tool.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new(@tools)
        send_data(pdf.render, filename: 'tools.pdf', type: 'application/pdf', disposition: 'inline')
      end
    end
  end

  def show
    @tool_variant = @tool.toolVariants.build
    @pagy, @tool_variants = pagy @tool.toolVariants.order(tool_number: :desc)
  end

  def new
    @tool = Tool.new
  end

  def edit; end

  def create
    @tool = Tool.new tool_params
    if @tool.save
      flash[:success] = t(:tool_created)
      redirect_to tools_path
    else
      flash[:error] = t(:error)
      redirect_to :new
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :body)
  end

  def set_tool!
    @tool = Tool.find params[:id]
  end
end
