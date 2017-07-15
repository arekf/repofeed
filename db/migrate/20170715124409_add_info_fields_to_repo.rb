class AddInfoFieldsToRepo < ActiveRecord::Migration[5.1]
  def change
    add_column :repos, :stars_count, :integer, null: false, default: 0
    add_column :repos, :open_issues_count, :integer, null: false, default: 0
    add_column :repos, :owner_avatar_url, :string
  end
end
