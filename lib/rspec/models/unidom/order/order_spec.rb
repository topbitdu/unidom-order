describe Unidom::Order::Order, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      placer_id:        SecureRandom.uuid,
      placer_type:      'Unidom::Order::Placer::Mock',
      taker_id:         SecureRandom.uuid,
      taker_type:       'Unidom::Order::Taker::Mock',
      number:           '202001019527',
      purchase_amount:  10.00,
      aggregate_amount: 12.00
    }

    number_length = described_class.columns_hash['number'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :number,
      {             } => 0,
      { number: nil } => 2,
      { number: ''  } => 2,
      { number: '1' } => 1,
      { number: 'A' } => 1,
      { number: '9'*(number_length-1) } => 1,
      { number: 'A'*(number_length-1) } => 1,
      { number: '9'*number_length     } => 0,
      { number: 'A'*number_length     } => 0,
      { number: '9'*(number_length+1) } => 1,
      { number: 'A'*(number_length+1) } => 1

    it_behaves_like 'validates numericality', model_attributes, :purchase_amount,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true
    it_behaves_like 'validates numericality', model_attributes, :aggregate_amount,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true

    order_item_1_attributes = {
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

    order_item_2_attributes = {
      ordered_id:      SecureRandom.uuid,
      ordered_type:    'Unidom::Order::Ordered::Mock',
      placer_id:       SecureRandom.uuid,
      placer_type:     'Unidom::Order::Placer::Mock',
      ordinal:         2,
      unit_price:      20.00,
      quantity:        24.00,
      purchase_amount: 480.00,
      subtotal_amount: 400.00
    }

    it_behaves_like 'has_many', model_attributes, :items, Unidom::Order::OrderItem, [ order_item_1_attributes, order_item_2_attributes ]

  end

end
