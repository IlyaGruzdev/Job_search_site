class Task < ApplicationRecord
  belongs_to :user
  has_many :responces, dependent: :destroy
  validates :title, presence: true, length: {maximum: 30}
  validates :body, :category, presence: true
  validates :cost, numericality: { only_integer: true }, inclusion: {in: 100..1000000,  message: "cost must be in 100..1000000"}
end
