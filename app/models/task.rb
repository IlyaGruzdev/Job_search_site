class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {maximum: 30}
  validates :body, :category, presence: true
end
