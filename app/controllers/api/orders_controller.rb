# frozen_string_literal: true

module Api
  class OrdersController < Api::ApplicationController
    before_action :find_order, only: [:update]

    def create
      order = OrderService.new(params, current_user).create
      render json: order[:data], status: order[:status]
    end

    def update
      render json: @order.update!(order_params)
    end

    private

    def order_params
      params.require(:order).permit(:status)
    end

    def find_order
      @order = Order.find params[:id]
    end
  end
end
