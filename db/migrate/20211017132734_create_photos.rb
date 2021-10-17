class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :user_id

      t.timestamps
    end
  end
end
