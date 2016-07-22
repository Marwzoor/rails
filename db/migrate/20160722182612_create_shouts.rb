class CreateShouts < ActiveRecord::Migration[5.0]
  def change
  	create_table :shouts do |t|
      t.text :message 
      t.integer :user_id
      t.timestamps
    end
  end
end
