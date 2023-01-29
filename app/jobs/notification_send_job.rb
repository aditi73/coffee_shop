# frozen_string_literal: true

class NotificationSendJob < ApplicationJob
  def perform(order_id)
    order = Order.find order_id
    order.status = 'ready'
    order.save
    NotificationMailer.new_order_email(order).deliver_now
  end
end
