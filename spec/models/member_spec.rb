require "rails_helper"

RSpec.describe Member do
  let(:member) { Member.new }

  it "creates a blank member" do
    expect(member).not_to be_valid
  end
end
