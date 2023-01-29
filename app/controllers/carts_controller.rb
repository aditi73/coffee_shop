# frozen_string_literal: true

class CartsController < ApplicationController
  def create_or_update
    CartService.new(cart_params, current_user).add_items
    redirect_to items_path
  end

  def show
    cart = Cart.find(params[:id])
    @cart_items = cart.cart_items
  end

  def cart_params
    permitted_params = { items: [] }
    permitted_params[:items] << params.permit(:item_id, :quantity).to_h
    permitted_params
  end
end
