class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :group_type

      t.timestamps
    end
  end
end
