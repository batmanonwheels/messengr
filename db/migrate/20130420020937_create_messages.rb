class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text, :null => false
      t.integer :room_id
      t.string :user, :null => false

      t.timestamps
    end
  end
end
