class CreateWebtoons < ActiveRecord::Migration
  def change
    create_table :webtoons do |t|
      t.string :title
      t.string :intro
      t.string :image
      t.string :genre
      t.float :score

      t.timestamps null: false
    end
  end
end
