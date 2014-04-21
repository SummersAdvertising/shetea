class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :image
      t.string :fbID
      t.string :name
      t.string :tel

      t.timestamps
    end
  end
end
