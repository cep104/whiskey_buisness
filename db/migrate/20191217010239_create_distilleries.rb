class CreateDistilleries < ActiveRecord::Migration[6.0]
  def change
    create_table :distilleries do |t|
      t.string :name
      t.string :about 
      t.integer :user_id
    end
  end
end
