class CreateCommits < ActiveRecord::Migration[5.1]
  def change
    create_table :commits do |t|
      t.references :repo, foreign_key: true
      t.string :sha, null: false
      t.text :message, null: false
      t.string :author_name, null: false
      t.string :author_email, null: false
      t.string :author_avatar_url
      t.datetime :commited_at, null: false

      t.timestamps
    end

    add_index :commits, [:repo, :sha], unique: true
  end
end
