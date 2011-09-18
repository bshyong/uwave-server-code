class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :phone
      t.string :twitter
      t.integer :time
      t.boolean :text

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
