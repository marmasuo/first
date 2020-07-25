class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :client
      t.string :client_person
      t.string :business
      t.string :result
      t.text :note
      t.timestamps
    end
  end
end
