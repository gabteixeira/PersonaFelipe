class CreatePersonagems < ActiveRecord::Migration[6.1]
  def change
    create_table :personagems do |t|
      t.string :title
      t.string :author
      t.date :published
      t.text :about

      t.timestamps
    end
  end
end
