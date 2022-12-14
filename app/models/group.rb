class Group < ApplicationRecord
  belongs_to :user
  # has_many :group_expenses, dependent: :destroy
  has_many :expenses

  validates :name, presence: true
  validates :icon, presence: true

  def total_expenses
    expenses.sum(:amount)
  end
end
