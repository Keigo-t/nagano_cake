class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|

      t.timestamps

      #追加のカラム
      t.string :name
    end
  end
end
