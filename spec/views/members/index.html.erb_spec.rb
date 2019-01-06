require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :email => "Email",
        :email_alternate => "Email Alternate",
        :url => "Url",
        :phone => "Phone",
        :phone_alternate => "Phone Alternate",
        :birthday => "Birthday",
        :joined_on => "Joined On",
        :renewed_on => "Renewed On",
        :expire_on => "Expire On",
        :directory_items => "Directory Items",
        :interests => "Interests",
        :source => "Source",
        :subscription_started_on => "Subscription Started On",
        :subscription_renewed_on => "Subscription Renewed On",
        :subscription_end_on => "Subscription End On",
        :newsletter_format => "Newsletter Format"
      ),
      Member.create!(
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :address => "Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :email => "Email",
        :email_alternate => "Email Alternate",
        :url => "Url",
        :phone => "Phone",
        :phone_alternate => "Phone Alternate",
        :birthday => "Birthday",
        :joined_on => "Joined On",
        :renewed_on => "Renewed On",
        :expire_on => "Expire On",
        :directory_items => "Directory Items",
        :interests => "Interests",
        :source => "Source",
        :subscription_started_on => "Subscription Started On",
        :subscription_renewed_on => "Subscription Renewed On",
        :subscription_end_on => "Subscription End On",
        :newsletter_format => "Newsletter Format"
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Email Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Alternate".to_s, :count => 2
    assert_select "tr>td", :text => "Birthday".to_s, :count => 2
    assert_select "tr>td", :text => "Joined On".to_s, :count => 2
    assert_select "tr>td", :text => "Renewed On".to_s, :count => 2
    assert_select "tr>td", :text => "Expire On".to_s, :count => 2
    assert_select "tr>td", :text => "Directory Items".to_s, :count => 2
    assert_select "tr>td", :text => "Interests".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "Subscription Started On".to_s, :count => 2
    assert_select "tr>td", :text => "Subscription Renewed On".to_s, :count => 2
    assert_select "tr>td", :text => "Subscription End On".to_s, :count => 2
    assert_select "tr>td", :text => "Newsletter Format".to_s, :count => 2
  end
end
