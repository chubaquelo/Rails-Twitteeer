class CreateTuitts < ActiveRecord::Migration[6.0]
  def change
    create_table :tuitts do |t|
      t.text :tuitt
      t.references :user

      t.timestamps
    end
  end
end
