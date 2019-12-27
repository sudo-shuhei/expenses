class ItemsController < ApplicationController
  def index
    @items = Item.all()
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    puts params[:date]
    @item = Item.new(
      price: params[:price],
      category: params[:category],
      memo: params[:memo],
      date: Date.new(params["date(1i)"]&.to_i, params["date(2i)"]&.to_i, params["date(3i)"]&.to_i)
    )
    if @item.save
      flash[:notice] = "記録しました"
      redirect_to("/items/index")
    else
      render("items/new")
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(price: params[:price],category: params[:category],memo: params[:memo],date: Date.new(params["date(1i)"]&.to_i, params["date(2i)"]&.to_i, params["date(3i)"]&.to_i) )
      flash[:notice] = "編集しました"
      redirect_to("/items/index")
    else
      render("items/edit")
    end
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    @item.destroy
    flash[:notice] = "削除しました"
    redirect_to("/items/index")
  end
end
