class CategoriesController < ApplicationController  
  before_action :set_find_id , only: %i[ show edit update destroy ]
  before_action :is_admin?
  include ApplicationHelper

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(categories_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(categories_params)
      redirect_to categories_path
    else
      render :index
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
  def categories_params
    params.require(:category).permit(:name, :status)
  end

  def set_find_id
    @category = Category.find(params[:id])
  end
end
