require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Tinotenda',
      email: 'tintin@gmail.com',
      password: '12345678'
    ),
            @group = Group.create(
              user_id: 1,
              name: 'Travel',
              icon: '🚘'
            ),
            @expense = Expense.create(
              user_id: 1,
              name: 'Rice',
              amount: 100,
              group_id: 1
            )
  end

  it '@expense created should be valid' do
    expect(@expense).to be_valid
  end

  it '@quantity must be an integer' do
    expect(@expense.name).to eq('Rice')
  end
  it '@group_id created should be valid' do
    expect(@expense.group_id).to eq(1)
  end
  it '@expense_id must be an integer greater than or equal zero.' do
    expect(@expense.amount).to eq(100)
  end
end
