class Expense < ApplicationRecord
  belongs_to :user
  # has_many :group_expense, dependent: :destroy
  belongs_to :group

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
