class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  def new
    @categories = Category.new
  end
  def create
    @categories = Category.new(categories_params)
    if @categories.save
      redirect_to '/categories'
    else
      render :new
    end
  end

  def edit
    @categories = Category.find(params[:id])
  end

  def update
    @categories = Category.find(params[:id])

    if @categories.update(categories_params)
      redirect_to '/categories'
    else
      render :index
    end
  end

  def destroy
    @categories = Category.find(params[:id])
    @categories.destroy

    redirect_to "/categories"
  end

  private
  def categories_params
    params.require(:category).permit(:name, :status)
  end
end
