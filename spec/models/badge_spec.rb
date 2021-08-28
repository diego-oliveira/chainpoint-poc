require 'rails_helper'

RSpec.describe Badge, type: :model do
  let(:badge) { FactoryBot.build(:badge) }

  it "is valid with valid attributes" do
    expect(badge).to be_valid
  end

  it "is not valid without a name" do
    badge.name = nil
    expect(badge).to be_invalid
  end

  it "is not valid without a uuid" do
    badge.uuid = nil
    expect(badge).to be_invalid
  end

  it "is not valid without a issue_date" do
    badge.issue_date = nil
    expect(badge).to be_invalid
  end
end
