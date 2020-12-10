class CreateSurvey < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|

      t.string :title, null: false
      t.text :questions, null: false
      t.belongs_to :user, null: false
      t.timestamps null: false
      
    end

    add_index :surveys, [:user_id, :title]
  end
end
