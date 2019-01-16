class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foregin_key: true
      t.references :movie, foregin_key: true

      t.timestamps
    end
  end
end
