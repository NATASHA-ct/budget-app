require 'rails_helper'

RSpec.describe Group, type: :model do
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
            )  
  end

  it '@group created should be valid' do
    expect(@group).to be_valid
  end

  it '@name must not be blank' do
    expect(@group.name).to eq('Travel')
  end

  it '@icon must be a link to an image' do
    expect(@group.icon).to eq('🚘')
  end

  it '@icon created should not  be valid' do
    expect(@group.icon).not_to eq(100)
  end

end