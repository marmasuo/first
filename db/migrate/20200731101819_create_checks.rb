class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|
      t.integer :user_id
      t.integer :board_id
      t.timestamps
    end
  end
end
