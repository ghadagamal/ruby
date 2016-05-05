class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :title
      t.string :attach
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
