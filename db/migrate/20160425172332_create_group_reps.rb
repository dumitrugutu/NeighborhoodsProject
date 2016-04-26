class CreateGroupReps < ActiveRecord::Migration
  def change
    create_table :group_reps do |t|
      t.references :group, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
