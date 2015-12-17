# Order Item 是订单项。

class CreateUnidomOrderItems < ActiveRecord::Migration

  def change

    create_table :unidom_order_items, id: :uuid do |t|

      t.references :order,   type: :uuid, null: false
      t.references :ordered, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :placer,  type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.integer :ordinal, null: false, default: 0

      t.decimal :unit_price,      null: false, default: 0.0, precision: 12, scale: 2
      t.decimal :quantity,        null: false, default: 0.0, precision: 12, scale: 2
      t.decimal :purchase_amount, null: false, default: 0.0, precision: 12, scale: 2
      t.decimal :subtotal_amount, null: false, default: 0.0, precision: 12, scale: 2

      t.text :instruction
      t.text :description

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_order_items, :order_id
    add_index :unidom_order_items, :ordered_id
    add_index :unidom_order_items, :placer_id

  end

end
