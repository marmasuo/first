class RemoveNameFromReports < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :name, :string
  end
end
