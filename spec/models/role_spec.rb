require 'rails_helper'

describe Role do
  let(:role) { build :role }

  it "has validations" do
    is_expected.to validate_presence_of :name
  end

  it "has relationships" do
    is_expected.to have_many :users
  end

  it "saves successfully" do
    expect(role.save).to be_truthy
  end
end
