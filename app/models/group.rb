class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expenses, dependent: :destroy
  has_many :expensess, through: :group_expenses 

  validates :name, presence: true
  validates :icon, presence: true
end
