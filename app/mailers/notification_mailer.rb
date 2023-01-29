# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def new_order_email(order)
    @order = order
    mail(to: order.user.email, subject: 'You got a new order!')
  end
end
