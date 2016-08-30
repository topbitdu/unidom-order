module Unidom::Order::Concerns::AsAdjusted

  extend ActiveSupport::Concern

  included do |includer|

    has_many :adjustments, class_name: 'Unidom::Order::OrderAdjustment', as: :adjusted

  end

end
