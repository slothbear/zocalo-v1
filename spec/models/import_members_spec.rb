require "rails_helper"

RSpec.describe "importing members" do

  describe "column name transformations" do
    it "standardizes column names"
    it "transforms column names to (Ruby-standard) snake case"
  end

  describe "ignore unneeded input fields" do
    it "ignores the DirectoryUpdate field"
    it "ignores the EmailList field"
  end

  describe "basic import requirements" do
    it "creates a valid member"
    it "prohibits an invalid member"
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

  describe "maintain legacy system dates" do
    it "copies 'Joined on' date as 'created_at'"
    it "copies 'Last Info Update' date as 'updated_at'"
  end
end
