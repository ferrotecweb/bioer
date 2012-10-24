class CreateProductRegisters < ActiveRecord::Migration
  def self.up
    create_table :product_registers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :product_registers
  end
end
