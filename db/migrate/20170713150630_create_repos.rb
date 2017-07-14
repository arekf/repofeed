# frozen_string_literal: true

class CreateRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :repos do |t|
      t.string :owner, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
