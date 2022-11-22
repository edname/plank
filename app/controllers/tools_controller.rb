# frozen_string_literal: true

class ToolsController < ApplicationController
  before_action :set_tool!, only: %i[edit]

  def index
    @pagy, @tools = pagy Tool.order(name: :asc)
   
    @tools = Tool.all
    respond_to do |format|  
      format.html
      format.pdf do
        pdf = OrderPdf.new(@tools)
        send_data(pdf.render, filename:'tools.pdf', type:'application/pdf', disposition:'inline')
      end
    end
    
  end

  def edit
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new tool_params
    if @tool.save
      flash[:success] = 'Tool was created'
      redirect_to tools_path
    else
      flash[:error] = 'Something went wrong.'
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
