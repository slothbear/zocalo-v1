require "rails_helper"

RSpec.describe Member do
  let(:member) { Member.new }

  it "creates a valid member" do
    expect(member).to be_valid
  end
end
