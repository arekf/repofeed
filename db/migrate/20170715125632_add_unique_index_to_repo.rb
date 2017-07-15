class AddUniqueIndexToRepo < ActiveRecord::Migration[5.1]
  def change
    add_index :repos, [:owner, :name], unique: true
  end
end
