# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = ItemService.new.items
  end

  def show
    @item = Item.find(params[:id])
  end
end
