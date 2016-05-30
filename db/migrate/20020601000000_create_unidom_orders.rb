class CreateUnidomOrders < ActiveRecord::Migration

  def change

    create_table :unidom_orders, id: :uuid do |t|

      t.references :placer, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :taker,  type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.column :number, 'char(12)', null: false, default: '0'*12

      t.decimal :purchase_amount,  null: false, default: 0.0, precision: 12, scale: 2
      t.decimal :aggregate_amount, null: false, default: 0.0, precision: 12, scale: 2

      t.text :instruction
      t.text :description

      t.string   :slug,             null: false, default: nil, limit: 200
      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_orders, :placer_id
    add_index :unidom_orders, :taker_id
    add_index :unidom_orders, :number, unique: true
    add_index :unidom_orders, :slug,   unique: true

  end

end
