class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :group_reps, index: true, foreign_key: true
      t.string :name
      t.string :organizer_contact_info
      t.datetime :event_time
      t.boolean :is_free, default: true
      t.string :location

      t.timestamps null: false
    end
  end
end
