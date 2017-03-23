describe Unidom::Order::OrderItem, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
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

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates numericality', model_attributes, :unit_price,
      range: 0..1_000_000_000, minimum_inclusive: true,  maximum_inclusive: true
    it_behaves_like 'validates numericality', model_attributes, :quantity,
      range: 0..1_000_000_000, minimum_inclusive: false, maximum_inclusive: true
    it_behaves_like 'validates numericality', model_attributes, :purchase_amount,
      range: 0..1_000_000_000, minimum_inclusive: true,  maximum_inclusive: true
    it_behaves_like 'validates numericality', model_attributes, :subtotal_amount,
      range: 0..1_000_000_000, minimum_inclusive: true,  maximum_inclusive: true

    order_attributes = {
      placer_id:        SecureRandom.uuid,
      placer_type:      'Unidom::Order::Placer::Mock',
      taker_id:         SecureRandom.uuid,
      taker_type:       'Unidom::Order::Taker::Mock',
      number:           '202001019527',
      purchase_amount:  10.00,
      aggregate_amount: 12.00
    }

    it_behaves_like 'belongs_to', model_attributes, :order, Unidom::Order::Order, order_attributes

    it_behaves_like 'monomorphic scope', model_attributes, :order_is, :order

  end

end
