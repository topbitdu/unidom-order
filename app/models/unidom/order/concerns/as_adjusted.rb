module Unidom::Order::Concerns::AsAdjusted

  extend ActiveSupport::Concern

  included do |includer|

    has_many :adjustments, class_name: 'Unidom::Order::OrderAdjustment', as: :adjusted

    def is_adjusted!(amount, due_to: 'FRGT', at: Time.now)
      query      = adjustments.adjustment_factor_coded_as(due_to).valid_at(now: at).alive
      adjustment = query.first
      if adjustment.present?
        if 0==amount
          adjustment.soft_destroy
        else
          adjustment.amount = amount
          adjustment.save!
        end
      else
        adjustment = query.create! amount: amount, opened_at: at
      end
      adjustment
    end

  end

end
