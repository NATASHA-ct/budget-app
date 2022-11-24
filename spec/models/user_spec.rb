require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(
      name: 'Blessing',
      email: 'bule@gmail.com',
      password: '123456'
    )
  end

  it '@user created should be valid' do
    expect(@user).to be_valid
  end

  it 'name value should be present' do
    @user.name = 'Blessing'
    expect(@user.name).to eq('Blessing')
  end
end