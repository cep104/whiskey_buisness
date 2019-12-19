class CreateWhiskey < ActiveRecord::Migration[6.0]
  def change
    create_table :whiskeys do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :distillery_id
    end
  end
end
