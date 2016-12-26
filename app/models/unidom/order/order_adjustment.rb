# Order Adjustment 是订单调整项。

class Unidom::Order::OrderAdjustment < Unidom::Order::ApplicationRecord

  self.table_name = 'unidom_order_adjustments'

  include Unidom::Common::Concerns::ModelExtension
  include ProgneTapera::EnumCode

  validates :amount, presence: true, numericality: { less_than: 1000000000, greater_than: -1000000000 }

  belongs_to :adjusted, polymorphic: true

  scope :adjusted_is, ->(adjusted) { where adjusted: adjusted }

  code :adjustment_factor, Unidom::Order::AdjustmentFactor

  def self.adjust!(adjusted, amount: 0, due_to: 'FRGT', opened_at: Time.now)
    query      = adjusted_is(adjusted).adjustment_factor_coded_as(due_to).valid_at(now: opened_at).alive
    adjustment = query.first
    if adjustment.present?
      if 0==amount
        adjustment.soft_destroy
      else
        adjustment.amount = amount
        adjustment.save!
      end
    else
      adjustment = query.create! amount: amount, opened_at: opened_at
    end
    adjustment
  end

end
