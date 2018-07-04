class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :rank
      t.string :title
      t.string :sales
      t.string :audi

      t.timestamps null: false
    end
  end
end
