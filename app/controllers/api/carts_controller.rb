# frozen_string_literal: true

module Api
  class CartsController < Api::ApplicationController
    def create
      render json: CartService.new(cart_params, current_user).add_items
    end

    def index
      user_cart = CartService.new(params, current_user)
      render json: { cart_items: user_cart.list_items, cart_total: user_cart.total_amount }
    end

    private

    def cart_params
      params.require(:cart).permit(items: %i[item_id quantity])
    end
  end
end
