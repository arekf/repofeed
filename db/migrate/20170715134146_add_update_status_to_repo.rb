# frozen_string_literal: true

class AddUpdateStatusToRepo < ActiveRecord::Migration[5.1]
  def change
    add_column :repos, :update_status, :integer, null: false, default: 0
  end
end
