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
      input = {"birthmonth" => "5", "birthday" => "25", "birthyear" => "1977"}

      # This function looks like we're testing Date.new — but only
      # sort of. It's also testing the birthday input fields. Sort of.
      birthday = MemberImporter.combine_birthday(input)
      expect(birthday).to be_a Date
      expect(birthday.month).to eq 5
      expect(birthday.day).to eq 25
      expect(birthday.year).to eq 1977
    end
    it "adds default year to birthdays if none was specified" do
      input = {"birthmonth" => "3", "birthday" => "30", "birthyear" => ""}
      birthday = MemberImporter.combine_birthday(input)
      expect(birthday.year).to eq DEFAULT_BIRTH_YEAR
    end
    it "treats year 0 as missing and uses default year" do
      input = {"birthmonth" => "3", "birthday" => "30", "birthyear" => "0"}
      birthday = MemberImporter.combine_birthday(input)
      expect(birthday.year).to eq DEFAULT_BIRTH_YEAR
    end
  end

  describe "copies directory exclusions to 'interests' field" do
    # The directory exclusions are not handled during import since their
    # content and formatting vary. Exclusions will be applied manually.
    it "copies exclusions to interests field" do
      input = {"directory" => "1", "exclude" => "zip and phones", "interests" => "zoos"}
      interests = MemberImporter.add_directory_exclusions(input)
      expect(interests).to include "zoos"  # maintain previous stuff
      expect(interests).to include "zip and phones"  # include new stuff
    end
    it "doesn't copy exclusions if member member declines to be in directory" do
      input = {"directory" => "0", "exclude" => "birthday", "interests" => "money"}
      interests = MemberImporter.add_directory_exclusions(input)
      expect(interests).to eq("money")
    end
    it "doesn't copy exclusions of 'n/a'" do
      input = {"directory" => "1", "exclude" => "n/a.", "interests" => "Alhambra"}
      interests = MemberImporter.add_directory_exclusions(input)
      expect(interests).to eq("Alhambra")
    end
    it "doesn't copy exclusions if nil" do
      input = {"directory" => "1", "exclude" => nil, "interests" => "books"}
      interests = MemberImporter.add_directory_exclusions(input)
      expect(interests).to eq("books")
    end
  end

  describe "member newsletter preferences" do
    it "records request for no email newsletter" do
      input = {"no_elec_nl" => "1"}
      template = MemberImporter.newsletter_preferences(input)
      expect(template).to eq("")
    end
    it "records request for attachment" do
      input = {"no_attach" => "0"}
      template = MemberImporter.newsletter_preferences(input)
      expect(template).to eq("attachment")
    end
    it "records request for link-only" do
      input = {"no_attach" => "1"}
      template = MemberImporter.newsletter_preferences(input)
      expect(template).to eq("link-only")
    end
  end

  describe "copy legacy system dates to Rails standard AR fields" do
    it "copies member joindate to Rails created_at" do
      input = {"joined_on" => "7/19/2000 0:00:00"}
      dated_member = MemberImporter.instantiate_dates(input)
      expect(dated_member["created_at"]).to eq(Date.new(2000,7,19))
      expect(dated_member["joined_on"]).to eq(Date.new(2000,7,19))
    end
    it "copies member LastInfoUpdate to Rails updated_at" do
      input = {"last_info_update" => "8/24/2013 0:00:00"}
      dated_member = MemberImporter.instantiate_dates(input)
      expect(dated_member["updated_at"]).to eq(Date.new(2013,8,24))
    end
  end

  describe "remove unneeded input fields" do
    it "removes the DirectoryUpdate field" do
      input = {"last_name" => "Jones", "DirectoryUpdate" => "1"}
      removals = ["DirectoryUpdate"]
      scrubbed = MemberImporter.remove_fields(input, removals)
      expect(scrubbed).to include("last_name")
      expect(scrubbed).not_to include("DirectoryUpdate")
    end
    it "removes multiple fields" do
      input = {"last_name" => "Noble", "no_attach" => "1", "email_list" => "No"}
      removals = ["no_attach", "email_list"]
      scrubbed = MemberImporter.remove_fields(input, removals)
      expect(scrubbed).to include("last_name")
      expect(scrubbed).not_to include("no_attach", "email_list")
    end
  end

  describe "basic import requirements" do
    it "creates a valid member" do
      file = file_fixture("valid_member.csv")
      MemberImporter.import_legacy_csv(file)
      expect(Member.where(last_name: "ValidLastName")).to exist
    end
    it "prohibits an invalid member" do
      file = file_fixture("bad_member.csv")
      expect{MemberImporter.import_legacy_csv(file)}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
