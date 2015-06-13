class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    # get data from form
    @item = Item.new(item_params)

    # save the retrieved data
    @item.save #this creates the id, create date and update date in the database.

    # throw the data to show.html.erb
    redirect_to "/items/#{@item.id}"

  end

  def edit
    # http://localhost:3000/items/5/edit
    # 上のURLの５を習得して、@item = Item.find(5)
    @item = Item.find(params[:id])
  end

  def update
    #:idでItem.find
    @item = Item.find(params[:id])         #????????????????????????????????????????????????????????????????????????????????????????????
    #
    @item.update_attributes(item_params)
    #redirect to the last page
    redirect_to "/items/#{@item.id}"
  end

  private #to keep the user form poverriding data that is important we use private

  def item_params
  # params.require(:key).permit(:filter)
    params.require(:item).permit(
      :name,
      :description,
      :price,
      :seller_id,
      :email,
      :image_url
    )
  end

end
