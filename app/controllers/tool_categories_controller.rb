# frozen_string_literal: true

class ToolCategoriesController < ApplicationController
    before_action :set_tool_category!, only: %i[show edit update destroy]
  
    def index
      @pagy, @tool_categories = pagy ToolCategory.order(name: :asc)
  
      @tool_categories = ToolCategory.all
      respond_to do |format|
        format.html
        format.pdf do
          pdf = OrderPdf.new(@tool_categories)
          send_data(pdf.render, filename: 'tools_category.pdf', type: 'application/pdf', disposition: 'inline')
        end
      end
    end
  
    def show
      @tool_list = @tool_category.tool_list.build
      @pagy, @tool_lists = pagy @tool_category.tool_list.order(number: :desc)
    end
  
    def new
      @tool_category = ToolCategory.new
    end
  
    def edit; end
  
    def create
      @tool_category = ToolCategory.new tool_category_params
      if @tool_category.save
        flash[:success] = t(:tool_category_created)
        redirect_to tool_categories_path
      else
        flash[:error] = t(:error)
        render :new
      end
    end
  
    def update
      if @tool_category.update tool_category_params
        flash[:success] = t(:tool_category_updated)
        redirect_to tool_categories_path
      else
        flash[:error] = t(:error)
        render 'edit'
      end
    end
  
    def destroy
      if @tool_category.destroy
        flash[:success] = t(:tool_category_deleted)
      else
        flash[:error] = t(:error)
      end
      redirect_to tool_categories_path    
    end
  
    private
  
    def tool_category_params
      params.require(:tool_category).permit(:name, :description)
    end
  
    def set_tool_category!
      @tool_category = ToolCategory.find params[:id]
    end




  end
