class CreateDistilleries < ActiveRecord::Migration[6.0]
  def change
    create_table :distilleries do |t|
      t.string :name
    end
  end
end
