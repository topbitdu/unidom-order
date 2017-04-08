shared_examples 'Unidom::Order::Concerns::AsOrderPlacer' do |model_attributes|

  context do

    order_1_attributes = {
      taker_id:         SecureRandom.uuid,
      taker_type:       'Unidom::Order::Taker::Mock',
      number:           SecureRandom.hex(6),
      purchase_amount:  10.00,
      aggregate_amount: 10.00
    }

    order_1_attributes = {
      taker_id:         SecureRandom.uuid,
      taker_type:       'Unidom::Order::Taker::Mock',
      number:           SecureRandom.hex(6),
      purchase_amount:  20.00,
      aggregate_amount: 20.00
    }

    it_behaves_like 'has_many', model_attributes, :placed_orders, Unidom::Order::Order, [ order_1_attributes, order_1_attributes ]

  end

end
