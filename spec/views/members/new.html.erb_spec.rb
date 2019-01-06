require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :email => "MyString",
      :email_alternate => "MyString",
      :url => "MyString",
      :phone => "MyString",
      :phone_alternate => "MyString",
      :birthday => "MyString",
      :joined_on => "MyString",
      :renewed_on => "MyString",
      :expire_on => "MyString",
      :directory_items => "MyString",
      :interests => "MyString",
      :source => "MyString",
      :subscription_started_on => "MyString",
      :subscription_renewed_on => "MyString",
      :subscription_end_on => "MyString",
      :newsletter_format => "MyString"
    ))
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

      assert_select "input[name=?]", "member[first_name]"

      assert_select "input[name=?]", "member[middle_name]"

      assert_select "input[name=?]", "member[last_name]"

      assert_select "input[name=?]", "member[address]"

      assert_select "input[name=?]", "member[city]"

      assert_select "input[name=?]", "member[state]"

      assert_select "input[name=?]", "member[zip]"

      assert_select "input[name=?]", "member[email]"

      assert_select "input[name=?]", "member[email_alternate]"

      assert_select "input[name=?]", "member[url]"

      assert_select "input[name=?]", "member[phone]"

      assert_select "input[name=?]", "member[phone_alternate]"

      assert_select "input[name=?]", "member[birthday]"

      assert_select "input[name=?]", "member[joined_on]"

      assert_select "input[name=?]", "member[renewed_on]"

      assert_select "input[name=?]", "member[expire_on]"

      assert_select "input[name=?]", "member[directory_items]"

      assert_select "input[name=?]", "member[interests]"

      assert_select "input[name=?]", "member[source]"

      assert_select "input[name=?]", "member[subscription_started_on]"

      assert_select "input[name=?]", "member[subscription_renewed_on]"

      assert_select "input[name=?]", "member[subscription_end_on]"

      assert_select "input[name=?]", "member[newsletter_format]"
    end
  end
end
