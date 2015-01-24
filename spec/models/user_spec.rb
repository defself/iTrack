require 'rails_helper'

describe User do
  let(:user) { build :user }

  it "has validations" do
    is_expected.to validate_presence_of :name
    is_expected.to validate_presence_of :email
    is_expected.to validate_presence_of :password
    is_expected.to validate_uniqueness_of :email
    is_expected.to allow_value('user@example.com').for :email
  end

  it "has relationships" do
    is_expected.to belong_to :role
  end

  it "saves successfully" do
    expect(user.save).to be_truthy
  end
end
