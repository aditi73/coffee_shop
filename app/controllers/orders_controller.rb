# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    order = OrderService.new(params, current_user).create
    if order[:data].present? && order[:data].id.present?
      redirect_to order_path(order[:data])
    else
      redirect_to items_path
    end
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end
end
