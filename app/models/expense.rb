class Expense < ApplicationRecord
  belongs_to :user
  # has_many :group_expense, dependent: :destroy
  belongs_to :group

  validates :name, presence: true
  validates :amount, presence: true
end
