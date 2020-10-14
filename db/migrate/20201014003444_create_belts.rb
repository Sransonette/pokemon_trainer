class CreateBelts < ActiveRecord::Migration
  def change
    create_table :belts do |t|
      t.string :name
      t.string :slots
      t.string :trainer_id
      t.timestamps null: false
    end
  end
end
