class ItemsController < ApplicationController
  def show
    @items = Item.find(params[:id])
  end
end
