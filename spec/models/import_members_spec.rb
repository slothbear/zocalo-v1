require "rails_helper"

RSpec.describe "importing members" do

  describe "column name transformations" do
    it "transforms column names to (Ruby-standard) snake case" do
      h = {"FirstName" => "Adam"}
      snake_names = MemberImporter.snake_case_names(h)
      expect(snake_names).to have_key("first_name")
    end
    it "lower cases column names as part of snake casing" do
      h = {"Zip" => "45424"}
      snake_names = MemberImporter.snake_case_names(h)
      expect(snake_names).to have_key("zip")
    end
    it "makes column names consistent and convential" do
      transmute_keys = {"Lastname" => "last_name"}
      columns = {"Lastname" => "Sheridan"}
      standard_names = MemberImporter.standardize_names(columns, transmute_keys)
      expect(standard_names).to include({"last_name" => "Sheridan"})
    end
    it "transforms multiple column names" do
      transmute_keys = {"email1" => "email", "email2" => "email_alternate"}
      columns = {"email1" => "js@example.com", "email2" => "sher@example.org"}
      standard_names = MemberImporter.standardize_names(columns, transmute_keys)
      expect(standard_names).to include("email", "email_alternate")
    end
    it "renames only columns that appear in the rename list" do
      transmute_keys = Hash.new     # no transformations requested
      columns = {"zip" => "45424"}
      standard_names = MemberImporter.standardize_names(columns, transmute_keys)
      expect(standard_names).to include("zip")
    end
  end

  describe "birthday" do
    it "combines month, day, and year into birthday" do
      input = Hash[
        "Birthmonth", 5,
        "Birthday", 25,
        "Birthyear", 1977
      ]

      # This function looks like we're testing the Date.new function —
      # but only sort of. It's also testing the birthday input fields. Sort of.
      birthday = MemberImporter.combine_birthday(input)
      expect(birthday).to be_a Date
      expect(birthday.month).to eq 5
      expect(birthday.day).to eq 25
      expect(birthday.year).to eq 1977
    end
    it "adds default year to birthdays if none was specified" do
      input = {"Birthmonth" => "3", "Birthday" => "30", "Birthyear" => ""}
      birthday = MemberImporter.combine_birthday(input)
      expect(birthday.year).to eq DEFAULT_BIRTH_YEAR
    end
    it "treats year 0 as missing and uses default year" do
      input = {"Birthmonth" => "3", "Birthday" => "30", "Birthyear" => "0"}
      birthday = MemberImporter.combine_birthday(input)
      expect(birthday.year).to eq DEFAULT_BIRTH_YEAR
    end
  end

  describe "directory preferences" do
    it "represents interests as an opt-in list"
    it "observes member requests to leave info out of directory"
  end

  describe "member newsletter preferences", focus: true do
    it "records request for no email newsletter" do
      input = {"NoElecNL" => "1"}
      template = MemberImporter.newsletter_preferences(input)
      expect(template).to eq("")
    end
    it "records request for attachment"
    it "records request for link-only"
  end

  describe "maintain legacy system dates as Rails standard AR fields" do
    it "copies 'Joined on' date as 'created_at'"
    it "copies 'Last Info Update' date as 'updated_at'"
  end

  describe "ignore unneeded input fields" do
    it "ignores the DirectoryUpdate field"
    it "ignores the EmailList field"
  end

  describe "basic import requirements" do
    it "creates a valid member"
    it "prohibits an invalid member"
  end
end
