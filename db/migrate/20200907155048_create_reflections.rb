class CreateReflections < ActiveRecord::Migration[6.0]
  def change
    create_table :reflections do |t|
      t.integer :prompt_id
      t.integer :user_id
      t.date :date
      t.text :body
      t.integer :gratitude_level
      t.integer :gratitude_change

      t.timestamps
    end
  end
end
