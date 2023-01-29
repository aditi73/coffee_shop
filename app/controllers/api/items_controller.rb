# frozen_string_literal: true

module Api
  class ItemsController < Api::ApplicationController
    def index
      render json: ItemService.new.items
    end
  end
end
