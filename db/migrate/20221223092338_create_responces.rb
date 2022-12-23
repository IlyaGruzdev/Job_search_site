class CreateResponces < ActiveRecord::Migration[7.0]
  def change
    create_table :responces do |t|
      t.string :title
      t.string :body
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
