class ChangeAvatarDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :avatar,from: nil, to: "avatar.jpg"
  end
end
