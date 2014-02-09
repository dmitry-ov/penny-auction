require 'spec_helper'

describe User do
  it { should respond_to(:betscount) }
  it { should validate_presence_of(:betscount) }
  it { should validate_numericality_of(:betscount).is_greater_than_or_equal_to(0) }

  it '#decrease betscount' do
    @user = User.create!(email: 'admin@test.com', password: '12345678', password_confirmation: '12345678',
                 admin: true, betscount: 42)
    expect { @user.decrease_betscount }.to change(@user, :betscount).by(-1)
  end
end
