module Unidom::Order::Concerns::AsOrderTaker

  extend ActiveSupport::Concern

  included do |includer|

    has_many :taken_orders, class_name: 'Unidom::Order::Order', as: :taker

  end

  module ClassMethods
  end

end
