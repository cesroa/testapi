class CreateTesters < ActiveRecord::Migration[5.2]
  def change
    create_table :testers do |t|
      t.string :movie
      t.string :director
      t.integer :year
      t.integer :score

      t.timestamps
    end
  end
end
