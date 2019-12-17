class CreateUserDistill < ActiveRecord::Migration[6.0]
  def change
    create_table :whiskey_distillerys do |t|
      t.integer :distillery_id
      t.integer :whiskey_id
  end
end
end
