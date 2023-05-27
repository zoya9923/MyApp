class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_title
      t.string :date
      t.timestamps
    end
  end
end
