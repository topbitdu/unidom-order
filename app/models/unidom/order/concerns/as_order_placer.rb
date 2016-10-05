module Unidom::Order::Concerns::AsOrderPlacer

  extend ActiveSupport::Concern

  included do |includer|

    has_many :placed_orders, class_name: 'Unidom::Order::Order', as: :placer

  end

  module ClassMethods
  end

end
