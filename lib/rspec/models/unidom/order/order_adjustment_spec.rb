describe Unidom::Order::OrderAdjustment, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      adjusted_id:            SecureRandom.uuid,
      adjusted_type:          'Unidom::Order::Adjusted::Mock',
      adjustment_factor_code: Unidom::Order::AdjustmentFactor::DISCOUNT_ADJUSTMENT.code,
      calculation_code:       'AMNT',
      amount:                 10.00
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates numericality', model_attributes, :amount,
      range: -1_000_000_000..1_000_000_000, minimum_inclusive: true,  maximum_inclusive: true

    order_attributes = {
      placer_id:        SecureRandom.uuid,
      placer_type:      'Unidom::Order::Placer::Mock',
      taker_id:         SecureRandom.uuid,
      taker_type:       'Unidom::Order::Taker::Mock',
      number:           '202001019527',
      purchase_amount:  10.00,
      aggregate_amount: 12.00
    }

    order_item_attributes = {
      order_id:        SecureRandom.uuid,
      ordered_id:      SecureRandom.uuid,
      ordered_type:    'Unidom::Order::Ordered::Mock',
      placer_id:       SecureRandom.uuid,
      placer_type:     'Unidom::Order::Placer::Mock',
      ordinal:         1,
      unit_price:      10.00,
      quantity:        12.00,
      purchase_amount: 120.00,
      subtotal_amount: 100.00
    }

    it_behaves_like 'belongs_to', model_attributes, :adjusted, Unidom::Order::Order,     order_attributes
    it_behaves_like 'belongs_to', model_attributes, :adjusted, Unidom::Order::OrderItem, order_item_attributes

    it_behaves_like 'polymorphic scope', model_attributes, :adjusted_is, :adjusted, [ Unidom::Order::Order, Unidom::Order::OrderItem ]

    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :adjustment_factor, Unidom::Order::AdjustmentFactor

    adjusted = Unidom::Order::Order.create! order_attributes
    it_behaves_like 'assert_present!', described_class, :adjust!, [ adjusted, amount: 0, due_to: 'FRGT', opened_at: Time.now ], [ { 0 => :adjusted }, :amount, :due_to, :opened_at ]

  end

end
