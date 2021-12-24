class CategoriesController < ApplicationController  
  before_action :set_find_id , only: %i[ show edit update destroy ]
  before_action :is_admin?, only: %i[ index ]

  def is_admin?
      if logged_in? && current_user.admin == true
      elsif logged_in? && current_user.admin == false
        redirect_to "/403"
      elsif
        flash[:danger] = "Vui lòng đăng nhập"
        redirect_to login_path
      end
  end

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
