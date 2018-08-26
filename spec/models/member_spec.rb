require "rails_helper"

RSpec.describe Member do
  it "creates a valid member" do
    member = Member.new
    expect(member).to be_valid
  end
end
