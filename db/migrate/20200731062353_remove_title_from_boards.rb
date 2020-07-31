class RemoveTitleFromBoards < ActiveRecord::Migration[6.0]
  def change
    remove_column :boards, :title, :string
  end
end
