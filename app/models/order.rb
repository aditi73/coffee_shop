# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :items_orders
  has_many :items, through: :items_orders
  belongs_to :user

  after_save :order_notification

  def order_notification
    if saved_change_to_status? && (saved_change_to_status[1] == 'paid')
      NotificationMailer.new_order_email(self).deliver_now
      NotificationSendJob.set(wait: 1.minutes).perform_later(id)
    end
  end
end
