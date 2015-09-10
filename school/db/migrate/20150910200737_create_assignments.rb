class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
