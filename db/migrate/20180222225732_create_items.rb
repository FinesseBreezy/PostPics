class CreateItems < ActiveRecord::Migration[5.1]
  def self.up
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :image
      t.timestamps
    end
  end
  def self.down
    drop_table:items
  end
end
