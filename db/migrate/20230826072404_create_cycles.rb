class CreateCycles < ActiveRecord::Migration[7.0]
  def change
    create_table :cycles do |t|
      t.integer :count
      t.integer :true_count
      t.integer :false_count

      t.timestamps
    end
  end
end
