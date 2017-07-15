# frozen_string_literal: true

class AddUniqueIndexToRepo < ActiveRecord::Migration[5.1]
  def change
    add_index :repos, %i[owner name], unique: true
  end
end
