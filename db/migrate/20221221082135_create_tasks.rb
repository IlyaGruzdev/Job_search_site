class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :body
      t.string :category
      t.belongs_to :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
