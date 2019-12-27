class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(
      name: params[:name]
    )
    if @category.save
      flash[:notice] = "追加しました"
      redirect_to("/categories/index")
    else
      render("categories/new")
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    category_name = params[:name]
    @items = Item.find_by(category: category_name)
    puts @items
    if @category.update(name: category_name) and @items.update(category: category_name)
      flash[:notice] = "編集しました"
      redirect_to("/categories/index")
    else
      render("categories/edit")
    end
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    flash[:notice] = "削除しました"
    redirect_to("/categories/index")
  end
end
