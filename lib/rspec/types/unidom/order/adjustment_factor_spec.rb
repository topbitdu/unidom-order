describe Unidom::Order::AdjustmentFactor, type: :type do

  before :each do
  end

  after :each do
  end

  it_behaves_like 'ProgneTapera::EnumConfig', 6, [
    { code: 'DSCT', name: 'discount_adjustment',           localized_name: '折扣调整'     },
    { code: 'SCHG', name: 'surcharge_adjustment',          localized_name: '额外费调整'   },
    { code: 'SLTX', name: 'sales_tax',                     localized_name: '销售税'       },
    { code: 'SPHD', name: 'shipping_and_handling_charges', localized_name: '装运和处理费' },
    { code: 'FEES', name: 'fee',                           localized_name: '手续费'       },
    { code: 'MISC', name: 'miscellaneous_charge',          localized_name: '杂项收费'     } ]

end
