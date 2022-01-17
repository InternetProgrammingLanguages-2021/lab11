class CreateCache < ActiveRecord::Migration[7.0]
  def change
    create_table :caches do |t|
      t.string "input"
      t.string "output"

      t.timestamps
    end
  end
end
