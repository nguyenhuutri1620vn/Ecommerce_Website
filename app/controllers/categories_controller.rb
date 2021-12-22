class CategoriesController < ApplicationController  
  before_action :is_admin?
  def is_admin?
      if logged_in? && current_user.admin == true
        redirect_to products_path
      elsif logged_in? && current_user.admin == false
          flash[:danger] = "Lỗi quyền quản trị"
          redirect_to frontend_index_path
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
end
