shared_examples 'Unidom::Order::Concerns::AsOrderTaker' do |model_attributes|

  context do

    order_1_attributes = {
      placer_id:         SecureRandom.uuid,
      placer_type:       'Unidom::Order::Placer::Mock',
      number:            SecureRandom.hex(6),
      purchase_amount:   10.00,
      aggregate_amount:  10.00
    }

    order_1_attributes = {
      placer_id:         SecureRandom.uuid,
      placer_type:       'Unidom::Order::Placer::Mock',
      number:            SecureRandom.hex(6),
      purchase_amount:   20.00,
      aggregate_amount:  20.00
    }

    it_behaves_like 'has_many', model_attributes, :taken_orders, Unidom::Order::Order, [ order_1_attributes, order_1_attributes ]

  end

end
