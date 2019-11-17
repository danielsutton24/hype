class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.boolean :done, default: false
      t.timestamps
    end
  end
end
