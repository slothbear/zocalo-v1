require "rails_helper"

RSpec.describe "importing members" do
  describe "basic import requirements" do
    it "creates a valid member"
    it "prohibits an invalid member"
    it "ingests all specified fields"
  end

  describe "birthday" do
    it "combines month, day, and year into birthday"
    it "adds default year to birthdays if none was specified"
  end

  describe "directory preferences" do
    it "represents interests as an opt-in list"
    it "observes member requests to leave info out of directory"
  end

  describe "member newsletter preferences" do
    it "records request for attachment"
    it "records request for link-only"
    it "records request for no email newsletter"
  end

  describe "ignore unneeded CSV fields" do
    it "ignore the 'directory update' field"
    it "ignores the 'email list' field"
    it "ignores the 'last info update' field"
  end
end
