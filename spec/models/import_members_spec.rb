require "rails_helper"

RSpec.describe "importing members" do

  describe "column name transformations", focus: true do
    it "transforms column names to (Ruby-standard) snake case" do
      h = {"FirstName" => "Adam"}
      std_names = MemberImporter.snake_case_names(h)
      expect(std_names).to have_key("first_name")
    end
    it "lower cases column names as part of snake casing" do
      h = {"Zip" => "zip"}
      std_names = MemberImporter.snake_case_names(h)
      expect(std_names).to have_key("zip")
    end
    it "makes column names consistent and convential"
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
